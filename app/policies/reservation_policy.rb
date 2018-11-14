class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    record.user == user
  end

  def create?
    true
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
