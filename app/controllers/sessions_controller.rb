# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :skip_verify_authorized!

  def new
    @user = User.new
  end

  def create
    result = CreateSession.call(session_params: session_params)
    if result.success?
      session[:current_user_id] = result.session_id
      redirect_to projects_path, notice: "You've successfully logged in!"
    else
      @user = User.new
      @user.errors.add :base, result.errors
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
