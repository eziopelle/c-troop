class Product < ApplicationRecord
  has_many :market_products, dependent: :destroy
end
