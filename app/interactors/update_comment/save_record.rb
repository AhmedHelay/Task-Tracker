# frozen_string_literal: true

class UpdateComment
  class SaveRecord
    include Interactor

    delegate :comment_params, :comment, to: :context

    def call
      context.fail!(error: 'Invalid comment data') unless comment.update(comment_params)
    end
  end
end
