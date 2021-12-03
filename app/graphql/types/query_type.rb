module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Project 
    field :projects , resolver: Resolvers::Projects
    field :project , resolver: Resolvers::Project

    #Task 
    field :tasks , resolver: Resolvers::Tasks

    #Comment 
    field :comments , resolver: Resolvers::Comments
  end
end
