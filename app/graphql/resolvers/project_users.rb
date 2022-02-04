# frozen_string_literal: true

module Resolvers
  class ProjectUsers < Resolvers::Base
    argument :project_id, Integer, required: true

    type [Types::Users], null: false

    def resolve(**params)
      ::Project.find(params[:project_id]).users
    end
  end
end
