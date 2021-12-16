# frozen_string_literal: true

module Mutations
  class CreateComment < BaseMutation
    argument :input, Types::Inputs::CommentInput, required: true

    type Types::CommentType

    def resolve(input:)
      result = ::CreateComment.call(
        comment_params: input.to_h,
        current_user: current_user
      )
      result.comment if result.success?
    end
  end
end
