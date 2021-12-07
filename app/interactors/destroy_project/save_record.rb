class DestroyProject
  class SaveRecord
    include Interactor

    delegate :project, :id, :current_user, to: :context

    def call
      delete_tasks
      delete_projects_relation
      unless project.destroy 
        context.fail!(error: "Project destroy failed")
      end
    end

    def delete_tasks
      Task.where(project_id: id).each do |task|
          DestroyTask.call(id: task.id, current_user: current_user)
      end
    end 

    def delete_projects_relation
      UserProject.where(project_id: id).each do |userProject|
        userProject.destroy
      end
    end
  end
end
