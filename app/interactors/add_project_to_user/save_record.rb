class AddProjectToUser
  class SaveRecord
    include Interactor

    delegate :user, :project_id, to: :context

    def call
      add_project_to_user
    end

    private

    def add_project_to_user 
      if  UserProject.exists?(user_id: user.id, project_id: project_id) 
        context.fail!(erorr: "User already member of project")  
      end
      UserProject.create(user_id: user.id, project_id: project_id)    
    end
  end
end