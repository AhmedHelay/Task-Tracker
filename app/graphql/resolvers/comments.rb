# frozen_string_literal: true

module Resolvers
  class Comments < Resolvers::Base
    argument :task_id, Integer, required: true

    type [Types::CommentType], null: false

    def resolve(**params)
      ::Task.find(params[:task_id]).comments
    end
  end
end
