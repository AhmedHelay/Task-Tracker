# frozen_string_literal: true

module Resolvers
  class Comments < Resolvers::Base
    argument :task_id, Integer, required: true

    type [Types::CommentType], null: false

    def resolve(**params)
      ::Comment.where(task_id: params[:task_id])
    end
  end
end
