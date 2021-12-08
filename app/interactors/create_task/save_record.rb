class CreateTask
  class SaveRecord
    include Interactor

    delegate :task_params, :task, to: :context

    def call
      context.task = create_task
      context.fail!(error: "Invalid data") unless task.save!
    end

    private

    def create_task
      Task.new(task_params)
    end
  end
end