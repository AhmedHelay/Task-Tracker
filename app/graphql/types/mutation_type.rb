# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Authentication
    field :sign_up, mutation: Mutations::SignUp
    field :sign_in, mutation: Mutations::SignIn

    # Project
    field :add_user_to_project, mutation: Mutations::AddUserToProject
    field :create_project, mutation: Mutations::CreateProject
    field :update_project, mutation: Mutations::UpdateProject
    field :destroy_project, mutation: Mutations::DestroyProject

    # Task
    field :create_task, mutation: Mutations::CreateTask
    field :update_task, mutation: Mutations::UpdateTask
    field :destroy_task, mutation: Mutations::DestroyTask

    # Comment
    field :create_comment, mutation: Mutations::CreateComment
    field :update_comment, mutation: Mutations::UpdateComment
  end
end
