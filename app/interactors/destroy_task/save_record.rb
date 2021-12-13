# frozen_string_literal: true

class DestroyTask
  class SaveRecord
    include Interactor

    delegate :task, :id, to: :context

    def call
      delete_comments
      context.fail!(error: 'Task destroy failed') unless task.destroy
    end

    def delete_comments
      Comment.where(task_id: id).each(&:destroy!)
    end
  end
end
