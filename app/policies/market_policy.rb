class MarketPolicy < ApplicationPolicy
  class Scope < Scope
    def show?
      true
    end
  end
end
