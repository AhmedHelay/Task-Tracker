# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy add_user]
  before_action :authenticate_current_user!
  before_action -> { authorize! @project }, only: %i[show edit update destroy]
  after_action :verify_authorized, except: %i[index create new show]

  def index
    @projects = current_user.projects.load
  end

  def show
    authorize! @project
  end

  def new
    @project = Project.new
  end

  def edit
    authorize! @project
  end

  def create
    results  =
      CreateProject.call(current_user: current_user, project_params: project_params)
    if results.success?
      redirect_to projects_url, notice: 'Project created successfully'
    else
      redirect_to projects_url, notice: "#{result.error}"
    end
  end

  def update
    authorize! @project
    result = UpdateProject.call(
      current_user: current_user,
      project_params: project_params.merge(id: @project.id)
    )
    if result.success?
      redirect_to projects_url, notice: 'Project updated successfully'
    else
      redirect_to edit_project_path(@project), notice: "#{result.error}"
    end
  end

  def destroy
    authorize! @project
    result = DestroyProject.call(current_user: current_user, id: @project.id)
    if results.success?
      redirect_to projects_url, notice: 'Project destroyed successfully'
    else 
      redirect_to projects_url, notice: "#{result.error}"
    end
  end

  def add_user
    authorize! @project
    result = AddProjectToUser.call(email: add_user_params[:email], project_id: @project.id)
    if result.success?
      redirect_to @project, notice: 'User added successfully' 
    else
      redirect_to @project, notice: "#{result.error}"
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def add_user_params
    params.require(:user).permit(:email)
  end
end
