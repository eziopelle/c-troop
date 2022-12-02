class MarketProduct < ApplicationRecord
  belongs_to :market
  belongs_to :product

  def test
    puts 'trololo'
  end

  def self.average_price
    sum = 0
    all.each do |product|
      sum += product.price  if product.price
    end
     sum / Market.count
  end
end
