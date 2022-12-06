class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if cookies[:tuto] == 'ok'
      redirect_to markets_path
    end
  end

  def tuto1
  end

  def tuto2
  end

  def tuto3
  end
end
