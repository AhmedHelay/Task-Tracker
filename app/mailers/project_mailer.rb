class ProjectMailer < ApplicationMailer    

    
    def create_project(project, current_user)
        set(project, current_user)
        send_msg_to_user('Project created')
    end

    def update_project(project, current_user)
        set(project, current_user)
        send_msg_to_user('Project updated')
    end

    def add_user_to_project(project, current_user)
        set(project, current_user)
        send_msg_to_user('User added to project')
    end

    private

    def set(project,current_user)
        @project = project 
        @user = current_user
        @url  = "http://localhost:3000/projects/#{@project.id}"
    end
end