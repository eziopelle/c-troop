class TicketsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :text_detection ]
  require "google/cloud/vision/v1"

  def index
    @tickets = policy_scope(Ticket)
    @ticket = current_user.tickets.last
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
      redirect_to '/dashboard'
    else
      render "pages#home", status: :unprocessable_entity
    end
    update
  end

  def update
    @ticket = current_user.tickets.last
    authorize @ticket
    text_detection
    @ticket.update(params_ticket)
  end

  def destroy
    authorize @ticket
    @ticket = ticket.find(params[:market_id])
    @ticket.destroy
  end

  def text_detection
    client = Google::Cloud::Vision::V1::ImageAnnotator::Client.new
    file_path = @ticket.photo.url
    @response = client.document_text_detection image: file_path
    @words = []

    @response.responses.each do |res|
      res.text_annotations.each do |annotation|
        @words << annotation.description
      end
    end

    total_price unless @words == [] || @words.nil?
    detect_brand_address unless @words == [] || @words.nil?
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
    @ticket.total_price = @total_price
  end

  def detect_brand_address
    match_data = @words[0].match(/(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}/)
    @regex = match_data[0].gsub(" ","")
    @market = Market.find_by(phone_number: match_data[0])
    @ticket.market_id = @market.id unless @market.nil?
  end

  private

  def params_ticket
    params.require(:ticket).permit(:date, :total_price, :user_id, :market_id, :photo)
  end
end
