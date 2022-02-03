# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_current_user!, except: %i[create new]
  before_action -> { authorize! @user }, only: %i[edit update destroy]
  before_action :skip_verify_authorized!, only: %i[show new create]

  after_action :verify_authorized, only: %i[edit update destroy]

  rescue_from ActiveRecord::RecordInvalid, with: :record_error!

  def show; end

  def edit
    authorize! @user
  end

  def new
    @user = User.new
  end

  def create
    @user = CreateUser.call(user_params: user_params)
    if @user.success?
      redirect_to projects_path, notice: 'User Created'
    else
      render :new, notice: 'Failed to create user'
    end
  end

  def update
    authorize! @user
    @user = UpdateUser.call(user_params: user_params.merge(id: @user.id))
    byebug
    if @user.success?
      redirect_to projects_path, notice: 'User updated'
    else
      redirect_to edit_user_path(@user), notice: 'Failed to update user'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def record_error!
    redirect_back fallback_location: new_user_path, alter: 'Validation error'
  end
end
