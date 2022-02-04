# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :authenticate_current_user!
  before_action -> { authorize! @task }, only: %i[show edit update destroy]
  after_action :verify_authorized, except: %i[create new]

  def index
    @tasks = @project.tasks
    skip_authorization
  end

  def show
    @comment = Comment.new
    authorize! @task
  end

  def new
    @task = Task.new
  end

  def edit
    authorize! @task
    @project = Project.find_by(id: @task.project_id)
  end

  def create
    @task ||=
      CreateTask.call(current_user: current_user, task_params: task_params)
    if @task.success!
      redirect_to project_path(task_params[:project_id]), notice: 'Task created successfully '
    else
      redirect_to project_path(task_params[:project_id]), notice: 'Task create failed'
    end
  end

  def update
    authorize! @task
    UpdateTask.call(task_params: task_params)
    if @task.success!
      redirect_to project_path(@task.project_id), notice: 'Task create failed'
    else
      redirect_to edit_task_path(@task), notice: 'Task create failed'
    end
  end

  def destroy
    authorize! @task
    id = @task.project_id
    DestroyTask.call(id: @task.id, current_user: current_user)
    redirect_to project_path(id), notice: 'Task destroyed successfully'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:id, :title, :description, :deadline_at, :project_id, :status)
  end
end
