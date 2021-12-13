# frozen_string_literal: true

module Mutations
  class UpdateComment < BaseMutation
    argument :id, ID, required: true
    argument :task_id, Integer, required: true
    argument :content, String, required: true

    type Types::CommentType

    def resolve(**params)
      result = ::UpdateComment.call(
        comment_params: params,
        current_user: current_user
      )
      result.comment if result.success?
    end
  end
end
