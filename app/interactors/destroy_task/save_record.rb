class DestroyTask
  class SaveRecord
    include Interactor

    delegate :task, :id, to: :context

    def call
      id = task.id
      unless task.destroy
        context.fail!(error: "Task destroy failed")
      end
    end
  end
end