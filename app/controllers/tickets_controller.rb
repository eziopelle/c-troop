class TicketsController < ApplicationController
  def index
    @tickets = policy_scope(Ticket)
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
    @user = current_user
    @ticket.user = @user

  end

  def create
    @ticket = Ticket.new(params_ticket)
    @ticket.user = current_user
    authorize @ticket
    if @ticket.save
      redirect_to '/tickets'
    else
      render "pages#home", status: :unprocessable_entity
    end
  end

  def destroy
    authorize @ticket
    @ticket = ticket.find(params[:market_id])
    @ticket.destroy
  end

  private

  def params_ticket
    params.require(:ticket).permit(:date, :total_price, :user_id, :photo)
  end
end
