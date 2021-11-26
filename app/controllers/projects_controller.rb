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
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
        user = User.find(current_user.id)
        user.projects_id.push(@project.id)
        user.save!
        ProjectMailer.with(
          project: @project, user: current_user)
          .project_created.deliver_later
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end


    
  end

  # PATCH/PUT /projects/1 or /projects/1.json
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

  # DELETE /projects/1 or /projects/1.json
  def destroy
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
    elsif !user.projects_id.include? @project.id 
            user.projects_id.push(@project.id)
            user.save!
            ProjectMailer.with(
              user: user,project: @project)
              .add_user_to_project.deliver_later
            redirect_to @project, notice: "User added successfully"
    else    
          redirect_to @project, notice: "User Already added project" 
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
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
