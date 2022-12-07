class MarketProduct < ApplicationRecord
  belongs_to :market
  belongs_to :product

  after_save :total_price

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


  private

  def total_price
    sum = 0
    market.market_products.each do |product|
      sum += product.price if product.price
    end
    market.update(total_price: sum)
  end
end
