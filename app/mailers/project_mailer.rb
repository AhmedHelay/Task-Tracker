class ProjectMailer < ApplicationMailer    

    
    def project_created(project,user)
        set(project,user)
        mail(to: @user.email, subject: 'Project created successfully')
    end

    def project_edited(project, user)
        set(project,user)
        mail(to: @user.email, subject: 'You Updated project successfully')
        send_to_other_users(subject: "Project updated")
    end

    def add_user_to_project(project,user)
        set(project,user)
        mail(to: @user.email, subject: "You were added to project")    
        send_to_other_users(subject: "User joined project")
    end

    private

    def set(project,user)
        @project = project 
        @user = user
        @url  = "http://localhost:3000/projects/#{@project.id}"
    end

    def send_to_other_users(subject)
        User.all.each do |u|
            if u.projects_id.include?(@project.id) && u != @user
                mail(to: u.email , subject: subject)
            end
        end
    end
end
