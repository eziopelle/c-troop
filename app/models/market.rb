class Market < ApplicationRecord
  has_one_attached :photo
  has_many :market_products, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
