class SessionsController < ApplicationController
  #skip_after_action :verify_authorized

  def new
    @user = User.new
  end
  
  def create

    authenticated_user = CreateSession.call(session_params: session_params)
    if authenticated_user.success?
      session[:current_user_id] = authenticated_user.session_id
      redirect_to projects_path, notice: "You've successfully logged in!"
    else
      @user = User.new
      @user.errors.add :base, authenticated_user.errors
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to new_session_path, notice: "You've successfully logged out!"
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
