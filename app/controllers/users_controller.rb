# frozen_string_literal: true

class UsersController < ApplicationController
  # skip_after_action :verify_authorized, only: %i[new create update]
  before_action :set_user, only: %i[show edit update destroy]

  def show; end

  def edit; end

  def new
    @user = User.new
  end

  def create
    @user = CreateUser.call(user_params: user_params)
    if @user.success?
      redirect_to new_session_path, notice: 'User Created'
    else
      render :new, notice: 'Failed to create user'
    end
  end

  def update
    @user = UpdateUser.call(user_params: user_params.merge(id: @user.id))
    if @user.success?
      redirect_to projects_path, notice: 'User updated'
    else
      redirect_to edit_user_path(@user), notice: 'Failed to update user'
    end
  end

  def destroy; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
