class TaskMailer < ApplicationMailer
    before_action :get_params , only: %i[task_created]

    def task_created
        mail(to: @user.email, 
            subject: "You created Task #{@task.title}  in project #{@project.name} successfully")
        User.all.each do |u|
            if u.projects_id.include?(@project.id)
                mail(to: u , "User #{@user.id}  added task: #{@task.title} to project #{@project.name}")
    end

    private

    def get_params
        @task  = params[:task]
        @project = params[:project]
        @user  = params[:user]
        @url  = "http://localhost:3000/tasks/#{@task.id}"
    end
end
