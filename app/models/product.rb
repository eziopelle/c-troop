class Product < ApplicationRecord
  has_one_attached :photo
  has_many :market_products, dependent: :destroy
end
