# frozen_string_literal: true

class TaskPolicy < ApplicationPolicy
  alias_method :task, :record
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    taskUser
  end

  def edit?
    update?
  end

  def update?
    taskUser
  end

  def destroy?
    taskUser
  end

  private 

  def taskUser
    UserProject
    .where(project_id: task.project_id)
    .map(&:user_id)
    .include?(user.id) 
  end
end
