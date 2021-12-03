class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy add_user]
  before_action :require_login 
  
  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  #  ProjectMailer.project_edited(@project,current_user).deliver
  end

  # POST /projects or /projects.json
  def create
    @project = create_project.project

    respond_to do |format|
      if create_project.success?
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
                
  def destroy
    User.all.each do |user|
      user.projects_id.delete(@project.id)
      user.save!
    end
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_user
    user = User.find_by(email: add_user_params[:email])
    if (user == nil)
        redirect_to @project, notice: "Counld't find user with this email!"
    else
        user.projects_id.push(@project.id).uniq!
        user.save!
        ProjectMailer.add_user_to_project(@project,current_user).deliver
        redirect_to @project, notice: "User added successfully"
    end
  end 

  private

    def create_project
        @create_project ||= 
          CreateProject.call(project_params: project_params,current_user: current_user)
    end
    
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description ).merge(user_id: current_user.id)
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
