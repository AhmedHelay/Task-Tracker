class CreateTask
  class SaveRecord
    include Interactor

    delegate :task_params, :task, to: :context

    def call
      context.task = task
      context.fail!(error: "Invalid data") unless task.save!
    end

    private

    def task
      Task.create(task_params)
    end
  end
end