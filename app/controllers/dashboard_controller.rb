class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @markets = policy_scope(Market)
    @markets = current_user.markets

    @markers = @markets.geocoded.map do |market|
      image = market.total_price < MarketProduct.average_price ? "ping-vert.png" : "ping-rouge.png"
      color = market.total_price < MarketProduct.average_price ? "green" : "red"
      {
        lat: market.latitude,
        lng: market.longitude,
        info_window: render_to_string( locals: { market: market }),
        image_url: helpers.asset_url(image),
        total_price: market.total_price.round(2),
        color: color,
        pourcentage: ((market.price_level * 100) - 100).round(2)
      }
    end
  end

end
