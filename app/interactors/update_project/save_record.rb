# frozen_string_literal: true

class UpdateProject
  class SaveRecord
    include Interactor

    delegate :project_params, :project, to: :context

    def call
      context.fail!(error: 'Invalid project data') unless project.update(project_params)
    end
  end
end
