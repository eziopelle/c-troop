class MarketsController < ApplicationController
  def index
    @markets = policy_scope(Market)

    # Marker pour géocoder (vic)
    @markers = @markets.geocoded.map do |market|
      {
        lat: market.latitude,
        lng: market.longitude
      }
    end
  end
  #TODO : Définir la show de market
end
