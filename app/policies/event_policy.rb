class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end

  def show?
    true
  end

  def create?
    user.admin?
    # record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
