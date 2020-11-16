module QueryTypes
  ProductQueryType = GraphQL::ObjectType.define do
    name 'ProductQueryType'
    description 'The product query type'

    field :products, types[Types::Product], 'returns all products' do
      resolve ->(_obj, _args, _ctx) { Product.all }
    end

    field :product, Types::Product, 'returns the queried product' do
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) { Product.find_by!(id: args[:id]) }
    end
  end
end
