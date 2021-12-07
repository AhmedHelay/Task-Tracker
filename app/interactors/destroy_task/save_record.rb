class DestroyTask
  class SaveRecord
    include Interactor

    delegate :task, :id, to: :context

    def call
      unless task.destroy
        context.fail!(error: "Task destroy failed")
      end
    end
  end
end