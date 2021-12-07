class DestroyTask
  class SaveRecord
    include Interactor

    delegate :task, :id, to: :context

    def call
      delete_comments
      unless task.destroy
        context.fail!(error: "Task destroy failed")
      end
    end

    def delete_comments
      Comment.where(task_id: id).each do |comment|
        comment.destroy!
      end
    end
  end
end