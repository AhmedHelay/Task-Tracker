module Mutations
  class CreateComment < BaseMutation

    argument :task_id, Integer, required: true
    argument :content, String, required: true

    type Types::CommentType

    def resolve(**params)
      result = ::CreateComment.call(
        comment_params: params,
        current_user: current_user
      )
      result.comment if result.success?
    end
  end
end
