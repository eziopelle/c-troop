class Market < ApplicationRecord
  has_many :tickets
  has_many :market_products, dependent: :destroy
end
