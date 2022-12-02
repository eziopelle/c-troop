class Ticket < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  belongs_to :market

  # def self.total_sum
  #   @total_sum = 0
  #   Ticket.all.each do |ticket|
  #     @total_sum += ticket.total_price
  #   end
  #   return @total_sum
  # end

  def self.total_month(month)
    @total_sum = 0
    Ticket.all.each do |ticket|
      @total_sum += ticket.total_price if ticket.created_at.month == month
    end
    return @total_sum
  end

  # def self.pourcent_economy
  #   @total_economy = 0
  #   if (product.mean_price - product.price) > 0
  #     Product.all.each do |product|
  #       @total_economy += (product.mean_price - product.price)
  #     end
  #     puts "Vous avez fait #{@total_economy}% d'économie ce mois-ci"
  #   elsif (product.mean_price - product.price) < 0
  #     Product.all.each do |product|
  #       @total_economy += (product.mean_price - product.price)
  #     end
  #     puts "Vous êtes en pertes de #{@total_economy}% ce mois-ci"
  #   else
  #     puts "Pas de pertes, pas d'économies ce mois-ci"
  #   end
  # end

#ligne 20 show dashboard
  # <p>Vous avez fait <%= Ticket.pourcent_economy %>% d'économie ce mois-ci</p>
end
