# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url = "http://localhost:3000/users/#{@user.id}"
    mail(to: @user.email, subject: 'Welcome to your account account')
  end
end
