class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
   true
  end

  def new?
    true
    # current_user.is_admin
  end

  def create?
    new?
  end

  def edit?
    true
    # current_user.is_admin
  end

  def update?
    edit?
  end

  def destroy?
    true
    # current_user.is_admin
  end
  
end
