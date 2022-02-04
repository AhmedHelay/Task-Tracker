# frozen_string_literal: true

class DestroyProject
  class PrepareParams
    include Interactor

    delegate :id, :project, to: :context

    def call
      context.project = Project.find(id)
      context.fail!(error: "Project not found, Deletion process failed") if project.nil?
    end
  end
end
