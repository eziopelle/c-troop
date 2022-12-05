class TicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :text_detection ]
  require "google/cloud/vision/v1"
  
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
    client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new

    # file_path = Rails.root.join('app','assets','images', 'invoice.jpeg').to_s
    # file_path = 'https://res.cloudinary.com/dbjv42wpc/image/upload/v1670000239/development/kwdb4med5pqwa436gnnxndh0etbm.jpg'
    file_path = @tickets.last.photo.url
    @response = client.document_text_detection image: file_path
    @words = []

    @response.responses.each do |res|
      res.text_annotations.each do |annotation|
        @words << annotation.description
      end
    end

    biggest_number
  end

  def biggest_number
    regex = /([^\s]*)(€|EUR)/
    @amounts = []
    @words.each do |word|
      @amounts << word.scan(regex).join.split('€') if word.match(regex)
    end
    @amounts[0].map! do |amount|
      amount.to_f
    end
    @biggest_number = @amounts[0].max
  end

  private

  def params_ticket
    params.require(:ticket).permit(:date, :total_price, :user_id, :photo)
  end
end
