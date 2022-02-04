# frozen_string_literal: true

class DestroyTask
  class SaveRecord
    include Interactor

    delegate :task, :id, to: :context

    def call
      context.fail!(error: 'Task destroy failed') unless task.destroy
    end
  end
end
