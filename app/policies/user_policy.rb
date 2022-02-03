# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    isUser
  end

  def update?
    isUser
  end

  def destroy?
    isUser
  end

  private

  def isUser
    record.id == user.id
  end
end
