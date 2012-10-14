class HomeController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @ads = Ad.limit(10).desc(:hits)
  end

  def search
    @ads = Ad.full_text_search(params[:q])

    render :index
  end

end
