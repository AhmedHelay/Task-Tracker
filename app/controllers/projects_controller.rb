# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy add_user]
  before_action :authenticate_current_user!
  before_action -> { authorize @project }, only: %i[show edit update destroy]
  after_action :verify_authorized, except: %i[index]

  def index
    @projects =
      Project.where(
        id: UserProject
        .where(user_id: current_user.id)
        .map(&:project_id)
      )
    skip_authorization
  end

  def show
    authorize @project
  end

  def new
    @project = Project.new
  end

  def edit
    authorize @project
  end

  def create
    authorize Project, :create?
    @project =
      CreateProject.call(current_user: current_user, project_params: project_params)
    if @project.save!
      redirect_to projects_url, notice: 'Project created successfully'
    else
      redirect_to projects_url, notice: 'Project creation failed failed'
    end
  end

  def update
    authorize @project
    @project = UpdateProject.call(
      current_user: current_user,
      project_params: project_params.merge(id: @project.id)
    )
    if @project.save!
      redirect_to projects_url, notice: 'Project was successfully updated'
    else
      redirect_to projects_url, notice: 'Project update failed'
    end
  end

  def destroy
    authorize @project
    DestroyProject.call(current_user: current_user, id: @project.id)
    redirect_to projects_url, notice: 'Project destroyed successfully'
  end

  def add_user
    authorize @project
    result = AddProjectToUser.call(email: add_user_params[:email], project_id: @project.id)
    if result.success?
      redirect_to @project, notice: "Counld't find user with this email!"
    else
      redirect_to @project, notice: 'User added successfully'
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
