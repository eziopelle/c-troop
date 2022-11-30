class MarketsController < ApplicationController
  def index
    @markets = Market.all

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
