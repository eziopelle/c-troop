class TicketsController < ApplicationController
  def index
    @tickets = policy_scope(Ticket)
  end

  def new
    @ticket = Ticket.new
    @ticket = Ticket.find(params[:ticket_id])
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(params_ticket)
    @ticket.market = @market
    @ticket.user = current_user
    authorize @ticket
    if @ticket.save
      redirect_to market_path(@market)
    else
      render "pages#home", status: :unprocessable_entity
    end
  end

  def destroy
    @ticket = ticket.find(params[:market_id])
    @ticket.destroy
  end

  private

  def set_market
    @market = Market.find(params[:market_id])
  end

  def params_ticket
    params.require(:ticket).permit(:total_price)
  end
end
