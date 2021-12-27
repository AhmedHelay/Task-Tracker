# frozen_string_literal: true

2
class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?; end

  def update?
    user.id == record.id
  end

  def new?
    create?
  end

  def create?
    user.nil?
  end
end
