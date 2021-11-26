class ProjectMailer < ApplicationMailer
    before_action :get_params , only: %i[project_created add_user_to_project]

    def project_created
        mail(to: @user.email, subject: 'You created project successfully')
    end

    def add_user_to_project
        mail(to: @user.email, subject: "You were added to project #{@project.name}")    
        User.all.each do |u|
            if u.projects_id.include?(@project.id) && u != @user
                mail(to: u , "User #{@user.id}  was added to project #{@project.name}")
    end

    private

    def get_params
        @project  = params[:project]
        @user  = params[:user]
        @url  = "http://localhost:3000/projects/#{@project.id}"
    end
end
