# frozen_string_literal: true

class DestroyTask
  class PrepareParams
    include Interactor

    delegate :id, :task, to: :context

    def call
      context.task = Task.find(id)
      context.fail!(error: 'Task not found, Deletion process failed') if task.nil?
    end
  end
end
