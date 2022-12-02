class MarketsController < ApplicationController
  def index
    @markets = policy_scope(Market)

    # Marker pour géocoder (vic)
    @markers = @markets.geocoded.map do |market|
      {
        lat: market.latitude,
        lng: market.longitude,
        info_window: render_to_string(partial: "info_window", locals: { market: market }),
        image_url: helpers.asset_url("ping-vert.png")

      }
    end
  end
  #TODO : Définir la show de market
end
