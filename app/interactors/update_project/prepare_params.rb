# frozen_string_literal: true

class UpdateProject
  class PrepareParams
    include Interactor

    delegate :current_user, :project_params, :project, to: :context

    def call
      context.project = prepare_project
    end

    private

    def prepare_project
      Project.find(project_params[:id])
    end
  end
end
