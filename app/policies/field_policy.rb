class FieldPolicy < ApplicationPolicy
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
    if (user.is_player == false && record.user == user)
      return true
    end
  end

  def destroy?
    if (user.is_player == false && record.user == user)
      return true
    end
  end
end
