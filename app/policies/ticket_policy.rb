class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def show?
      true
    end

    def index
      true
    end
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
