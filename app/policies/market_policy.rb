class MarketPolicy < ApplicationPolicy
  class Scope < Scope
    def show?
      true
    end

    def index
      true
    end
  end
end
