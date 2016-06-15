class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

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
    @band = Band.find(params[:id])
  end

  def update
    band = Band.find(params[:id])

    if band.update(band_params)
      flash[:notice] = "Your changes have been saved"
      redirect_to band_path(band)
    else
      flash[:alert] = "Something went wrong when updating your changes"
      render :edit
    end
  end

  def destroy
    band = Band.find(params[:id])

    if band.destroy
      flash[:notice] = "Your band has been removed successfully"
      redirect_to bands_path
    else
      flash[:alert] = "Your band could not be deleted"
      render :show
    end
  end

  private

  def band_params
    params.require(:band).permit(:id, :name, :start_time, :end_time, :description, :website_url, :soundcloud_url)
  end
end
