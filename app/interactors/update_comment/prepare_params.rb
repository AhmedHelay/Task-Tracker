# frozen_string_literal: true

class UpdateComment
  class PrepareParams
    include Interactor

    delegate :current_user, :comment_params, :comment, to: :context

    def call
      context.prepared_comment_params = prepare_comment_params
      context.comment = prepare_comment
    end

    private

    def prepare_comment
      Comment.find(comment_params[:id])
    end

    def prepare_comment_params
      comment_params.merge(user_id: current_user.id)
    end
  end
end
