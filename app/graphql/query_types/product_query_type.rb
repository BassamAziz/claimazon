module QueryTypes
  ProductQueryType = GraphQL::ObjectType.define do
    name 'ProductQueryType'
    description 'The product query type'

    field :products, types[Types::Product], 'returns all products' do
      resolve ->(_obj, _args, _ctx) { Product.all }
    end
  end
end
