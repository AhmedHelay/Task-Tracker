class AddProjectToUser
  class SaveRecord
    include Interactor

    delegate :user, :project_id, to: :context

    def call
      add_project_to_user
    end

    private

    def add_project_to_user 
      user_project = UserProject.find_or_create_by(user_id: user.id, project_id: project_id)
      user_project.save!
    end
  end
end