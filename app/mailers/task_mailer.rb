class TaskMailer < ApplicationMailer
    def task_created(task,project,user)
        set_params(task,project,user)
        mail(to: @user.email, 
            subject: "Task created successfully")
        User.all.each do |u|
            if u.projects_id.include?(@project.id)
                mail(to: u.email , subject: "Task added to project successfully")
            end
        end
    end

    private

    def set_params(task,project,user)
        @task  = task
        @project = project
        @user  = user
        @url  = "http://localhost:3000/tasks/#{@task.id}"
    end
end
