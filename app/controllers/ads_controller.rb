class AdsController < ApplicationController
  def index
    @ads = Ad.all
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def create
    @ad = Ad.new(params[:ad])
    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Add was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @ad = Ad.find(params[:id])
    respond_to do |format|
      if @ad.update_attributes(params[:ad])
        format.html { redirect_to @ad, notice: 'Add was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end

  end
end
