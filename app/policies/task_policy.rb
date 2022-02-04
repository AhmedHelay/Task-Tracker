# frozen_string_literal: true

class TaskPolicy < ApplicationPolicy
  alias task record
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
    task.user_ids.include?(user.id)
  end
end
