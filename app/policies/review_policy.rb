class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    user.id == record.user.id
  end

  def update?
    edit?
  end

  def destroy?
    user.id == record.user.id
  end
end
