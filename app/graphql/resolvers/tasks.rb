# frozen_string_literal: true

module Resolvers
  class Tasks < Resolvers::Base
    type [Types::TaskType], null: false

    def resolve(**_params)
      ::Task.all
      # ::Task.where(project_id: params[:project_id])
    end
  end
end
