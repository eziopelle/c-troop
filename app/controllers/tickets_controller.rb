class TicketsController < ApplicationController
  def index
    @tickets = policy_scope(Ticket)
    text_detection
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

  def text_detection
    path = "#{Rails.root}/app/assets/images/test_ticket.jpeg"
    # path = @tickets.last.photo.url
    @image = RTesseract.new(path, lang: 'fra')
    @words = []
    @image.to_box.each do |word|
      @words << word[:word]
    end
  end

  private

  def params_ticket
    params.require(:ticket).permit(:date, :total_price, :user_id, :photo)
  end
end
