module Types
  class UserProjectType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :project_id, Integer, null: false
    field :user, Types::UserType, null: false
    field :project, Types::ProjectType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
