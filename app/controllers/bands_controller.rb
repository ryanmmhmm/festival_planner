class BandsController < ApplicationController
  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      flash[:notice] = "You have added a Band to your festival"
      redirect_to band_path(@band)
    else
      flash[:alert] = "There was a problem creating your band"
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit

  end

  def update

  end

  private

  def band_params
    params.require(:band).permit(:id, :name, :start_time, :end_time, :description, :website_url, :soundcloud_url)
  end
end
