class AdsController < ApplicationController
  layout 'ad'
  include Rails3JQueryAutocomplete::Orm::Mongoid

  before_filter :authenticate_user!, :except =>  [:interested]
  before_filter :fetch_ads, :except => [:new, :create, :interested]
  autocomplete :category, :name

  def index
  end

  def new
    @ad = Ad.new
    2.times { @ad.images.build }
  end

  def edit
    @ad = @ads.find(params[:id])
  end

  def create
    @ad = current_user.ads.new(params[:ad])
    @ad.phone_number ||= current_user.phone_number
    @ad.address ||= current_user.address

    respond_to do |format|
      if @ad.save
        format.html { redirect_to ads_path, notice: 'Add was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @ad = @ads.find(params[:id])
    respond_to do |format|
      if @ad.update_attributes(params[:ad])
        format.html { redirect_to @ad, notice: 'Add was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def publish
    @ad = @ads.find(params[:id])
    if @ad.update_attribute(:published, true)
      flash[:notice] = "You successfully published ad"
    else
      flash[:error] = "Sorry!! can't publish the ad"
    end
    redirect_to ads_path 
  end

  def destroy
    @ad = @ads.find(params[:id])
    if @ad.destroy
      flash[:notice] = 'Successfully removed!!!'
    else
      flash[:error] = "Sorry!! can't remove ad"
    end
    redirect_to ads_path
  end

  def interested
    @ad = Ad.find(params[:id])
    
    if current_user
      @ad.views.find_or_create_by(:user_id => current_user.id)
    else
      @ad.views.create
    end
    @ad.inc(:hits, 1)

    render :nothing => true
  end

  private

  def fetch_ads
    @ads = current_user.ads
  end
end
