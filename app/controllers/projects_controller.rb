class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy add_user]
  before_action :require_login 
  
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit  
  end

  def create
    @project ||= 
    CreateProject.call(project_params: project_params,current_user: current_user)
      if @project.success?
        redirect_to projects_url, notice: "Project created successfully"
      else
        redirect_to projects_url, notice: "Project creation failed failed"
      end
  end

  def update
    @project = UpdateProject.call(
      project_params: project_params.merge(:id => @project.id),
      current_user: current_user)
      if @project.success?
        redirect_to @project, notice: "Project was successfully updated."
      else
        redirect_to edit_project_url, status: :unprocessable_entity
      end
  end
                
  def destroy
    DestroyProject.call(@project)
    redirect_to projects_url, notice: "Project destroyed successfully "
  end

  def add_user
    UserToProject.call(add_user_params: add_user_params)
    if user.save!
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