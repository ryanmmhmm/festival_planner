class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def new
    @festival = Festival.find(params[:festival_id])
    @band = @festival.bands.new
  end

  def create
    @festival = Festival.find(params[:festival_id])
    @band = @festival.bands.new(band_params)

    if @band.save
      flash[:notice] = "You have added a Band to your festival"
      redirect_to festival_band_path(@festival, @band)
    else
      if @band.errors.any?
        flash[:alert] = @band.errors.full_messages
      end
      render :new
    end
  end

  def show
    @festival = Festival.find(params[:festival_id])
    @band = Band.find(params[:id])
  end

  def edit
    @festival = Festival.find(params[:festival_id])
    @band = Band.find(params[:id])
  end

  def update
    @festival = Festival.find(params[:festival_id])
    @band = Band.find(params[:id])

    if @festival.bands.update(band_params)
      flash[:notice] = "Your changes have been saved"
      redirect_to festival_band_path(@festival, @band)
    else
      flash[:alert] = "Something went wrong when updating your changes"
      render :edit
    end
  end

  def destroy
    band = Band.find(params[:id])

    if band.destroy
      flash[:notice] = "Your band has been removed successfully"
      redirect_to festival_bands_path(band.festival_id)
    else
      flash[:alert] = "Your band could not be deleted"
      render :show
    end
  end

  private

  def band_params
    params.require(:band).permit(:id, :festival_id, :name, :start_time, :end_time, :description, :website_url, :soundcloud_url)
  end
end
