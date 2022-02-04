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
    result = CreateTask.call(current_user: current_user, task_params: task_params)
    if result.success?
      redirect_to project_path(task_params[:project_id]), notice: 'Task created successfully'
    else
      redirect_to project_path(task_params[:project_id]), notice: "#{result.error}"
    end
  end

  def update
    authorize! @task
    result = UpdateTask.call(current_user: current_user, task_params: task_params.merge(id: @task.id))
    if result.success?
      redirect_to project_path(@task.project_id), notice: 'Task updated successfully'
    else
      redirect_to edit_task_path(@task), notice: "#{result.error}"
    end
  end

  def destroy
    authorize! @task
    id = @task.project_id
    result = DestroyTask.call(id: @task.id, current_user: current_user)
    if result.success?
      redirect_to project_path(id), notice: 'Task destroyed successfully'
    else 
      redirect_to project_path(id), notice: "#{results.error}"
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:id, :title, :description, :deadline_at, :project_id, :status)
  end
end
