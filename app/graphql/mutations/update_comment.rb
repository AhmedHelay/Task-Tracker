# frozen_string_literal: true

module Mutations
  class UpdateComment < BaseMutation
    argument :input, Types::Inputs::UpdateCommentInput, required: true

    type Types::CommentType

    def resolve(input:)
      result = ::UpdateComment.call(
        comment_params: input.to_h,
        current_user: current_user
      )
      result.comment if result.success?
    end
  end
end
