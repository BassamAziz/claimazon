module Types
  RecommendationType = GraphQL::ObjectType.define do
    name 'RecommendationType'
    description 'Recommendation definition for recommendations'

    field :degree, !types.Int
  end
end