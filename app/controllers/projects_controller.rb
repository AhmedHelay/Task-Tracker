class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy add_user]
  before_action :require_login 
  
  def index
    ids = []
    UserProject.where(user_id: current_user.id).each do |userProject|
        ids << userProject.project_id
    end
    @projects = Project.where(id: ids)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit  
  end

  def create
    @project = 
    CreateProject.call(current_user: current_user, project_params: project_params)
      if @project.save!
        redirect_to projects_url, notice: "Project created successfully"
      else
        redirect_to projects_url, notice: "Project creation failed failed"
      end
  end

  def update
    @project = UpdateProject.call(
      current_user: current_user,
      project_params: project_params.merge(:id => @project.id)
    )
      if @project.save!
        redirect_to projects_url, notice: "Project was successfully updated"
      else
        redirect_to projects_url, notice: "Project update failed"
      end
  end
                
  def destroy
    DestroyProject.call(current_user: current_user, id: @project.id)
    redirect_to projects_url, notice: "Project destroyed successfully"
  end

  def add_user
    result = AddProjectToUser.call(email: add_user_params[:email], project_id: @project.id)
    if result.success?
        redirect_to @project, notice: "Counld't find user with this email!"
    else
        redirect_to @project, notice: "User added successfully"
    end
  end 

  private
    
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description )
    end
    
    def require_login
      unless current_user
        redirect_to new_user_registration_path
        end
    end

    def add_user_params
      params.require(:user).permit(:email)
    end
end