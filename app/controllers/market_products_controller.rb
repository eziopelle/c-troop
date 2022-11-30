class MarketProductsController < ApplicationController
  def update
    @market.user = current_user
    @market.update(params_market)
    redirect_to market_path(@market)
  end

  def edit

  end

  def set_market
    @market = Market.find(params[:id])
  end

  def params_market
    params.require(:market).permit(:brand, :address)
  end
end
