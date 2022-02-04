# frozen_string_literal: true

class AddProjectToUser
  class SaveRecord
    include Interactor

    delegate :user, :project_id, :user_project, to: :context

    def call
      add_project_to_user
    end

    private

    def add_project_to_user
      context.fails!(error: 'Server Error: Add user to project failed') unless 
        Project.find(project_id).users << user
    end
  end
end
