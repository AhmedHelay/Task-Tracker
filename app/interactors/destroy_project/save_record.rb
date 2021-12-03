class DestroyProject
  class SaveRecord
    include Interactor

    delegate :project, :id, to: :context

    def call
      delete_project_for_all_users
      unless project.destroy 
        context.fail!(error: "Project destroy failed")
      end
    end

    def delete_project_for_all_users
      User.all.each do |user|
        user.projects_id.delete(id)
        user.save!
      end
    end
  end
end