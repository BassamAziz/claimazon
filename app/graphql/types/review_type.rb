module Types
  ReviewType = GraphQL::ObjectType.define do
    name 'ReviewType'
    description 'Review definition for reviews'

    field :id, !types.ID
    field :message, types.String
    field :rating, types.Int
  end
end