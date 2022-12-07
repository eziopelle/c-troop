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

  def update

  end

  def destroy
    authorize @ticket
    @ticket = ticket.find(params[:market_id])
    @ticket.destroy
  end

  def text_detection
    client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new

    file_path = @tickets.last.photo.url
    @response = client.document_text_detection image: file_path
    @words = []

    @response.responses.each do |res|
      res.text_annotations.each do |annotation|
        @words << annotation.description
      end
    end

    total_price
  end

  def total_price
    regex = /([^\s]*)(€|EUR)/
    @amounts = []
    @words.each do |word|
      @amounts << word.scan(regex).join.split('€') if word.match(regex)
    end
    @amounts[0].map! do |amount|
      amount.to_f
    end
    @total_price = @amounts[0].max
  end

  def detect_brand_address
    match_data = @words.match(/(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/)
    match_data[0].gsub(" ","")
    Market.find_by(phone_number: match_data[0])
  end

  private

  def params_ticket
    params.require(:ticket).permit(:date, :total_price, :user_id, :photo)
  end
end
