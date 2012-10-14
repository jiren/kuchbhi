class HomeController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @ads = Ad.limit(5)
  end

  def search
    #params[:q]
    @ads = Ad.limit(5)

    render :index
  end

end
