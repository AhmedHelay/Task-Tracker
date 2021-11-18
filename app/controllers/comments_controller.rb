class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  
  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end


  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to task_path(Task.find(@comment.task_id)), notice: "Comment was successfully created."
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:task_id, :content).merge(user_id: current_user.id)
    end
    before_action :require_login 
    def require_login
      unless current_user
        redirect_to new_user_registration_path
        end
    end
end
