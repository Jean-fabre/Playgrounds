class ClubPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    if user.is_player == false
      return true
    end
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
