module Types
  TagType = GraphQL::ObjectType.define do
    name 'TagType'
    description 'Tag definition for tags'

    field :id, !types.ID
    field :name, !types.String
  end
end