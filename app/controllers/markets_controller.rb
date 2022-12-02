class MarketsController < ApplicationController
  def index
    @markets = policy_scope(Market)

    # Marker pour géocoder (vic)
    @markers = @markets.geocoded.map do |market|
      image = market.total_price > MarketProduct.average_price ? "ping-vert.png" : "ping-rouge.png"
      color = market.total_price > MarketProduct.average_price ? "green" : "red"
      {
        lat: market.latitude,
        lng: market.longitude,
        info_window: render_to_string(partial: "info_window", locals: { market: market }),
        image_url: helpers.asset_url(image),
        total_price: market.total_price,
        color: color
      }
    end
  end
  #TODO : Définir la show de market
end
