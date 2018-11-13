class FieldPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    if (user.is_player == false && record.user == user)
      return true
    end
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
