# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  alias project record

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    isProjectUser
  end

  def edit?
    update?
  end

  def update?
    isProjectUser
  end

  def destroy?
    isProjectUser
  end

  def add_user?
    isProjectUser
  end

  private

  def isProjectUser
    project.user_ids.include?(user.id)
  end
end
