class MarketProduct < ApplicationRecord
  belongs_to :market
  belongs_to :product
end
