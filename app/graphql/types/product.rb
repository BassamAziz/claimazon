module Types
  Product = GraphQL::ObjectType.define do
    name 'Product'
    description 'The Product type'

    field :sku, !types.ID
    field :author, !types.String
    field :title, !types.String
    field :description, !types.String
    field :thumbnail, !types.String
    field :image, !types.String
    field :price_cents, !types.Int
    field :price_currency, !types.String
    field :items_in_stock, !types.Int
    field :rating, types.Int
    field :tags, types[Types::TagType], resolve: -> (obj, args, ctx) do
      BatchLoader::GraphQL.for(obj.id).batch(default_value: []) do |product_ids, loader|
        ProductTag.where(product_id: product_ids).includes(:tag).each do |product_tag|
          loader.call(product_tag.product_id) { |memo| memo << product_tag.tag }
        end
      end
    end

    field :reviews, types[Types::ReviewType], resolve: -> (obj, args, ctx) do
      BatchLoader::GraphQL.for(obj.id).batch(default_value: []) do |product_ids, loader|
        Review.where(product_id: product_ids).each do |review|
          loader.call(review.product_id) { |memo| memo << review }
        end
      end
    end

    field :recommendations, types[types.Int], resolve: -> (obj, args, ctx) do

      BatchLoader::GraphQL.for(obj.id).batch(default_value: []) do |product_ids, loader|
        Recommendation.where(product_id: product_ids).each do |recommendation|
          loader.call(recommendation.product_id) { |memo| memo << recommendation.degree }
        end
      end
    end
  end
end


