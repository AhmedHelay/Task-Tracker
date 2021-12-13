# frozen_string_literal: true

class UpdateTask
  class SaveRecord
    include Interactor

    delegate :task_params, :task, to: :context

    def call
      context.fail!(error: 'Invalid data') unless task.update(task_params)
    end
  end
end
