class MarketsController < ApplicationController
  def index
    @markets = Market.all

    # Marker pour géocoder (vic)
    authorize @markets
    @markers = @markets.geocoded.map do |market|
      {
        lat: market.latitude,
        lng: market.longitude
      }
    end
  end
  #TODO : Définir la show de market
end
