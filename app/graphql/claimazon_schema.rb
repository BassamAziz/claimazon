ClaimazonSchema = GraphQL::Schema.define do
  # mutation(Types::MutationType)
  query(Types::QueryType)

  # enable batch loading
  use BatchLoader::GraphQL
end
