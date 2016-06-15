class FestivalsController < ApplicationController
  def index
    @festivals = Festival.all
  end

  def new
    @festival = Festival.new
  end

  def create
    @festival = Festival.new(festival_params)

    if @festival.save
      flash[:notice] = "Thank you for creating a new festival!"
      redirect_to @festival
    else
      render :new
    end
  end

  def show
    @festival = Festival.find(params[:id])
  end

  def edit
    @festival = Festival.find(params[:id])
  end

  def update
    festival = Festival.find(params[:id])

    if festival.update(festival_params)
      flash[:notice] = "Your festival has been updated"
      redirect_to festival_path(festival)
    else
      flash[:alert] = "There was a problem updating your festival"
      render :edit
    end
  end

  def destroy
    festival = Festival.find(params[:id])

    if festival.destroy
      flash[:notice] = "Your festival has been permanently removed"
      redirect_to festivals_path
    else
      flash[:alert] = "Something went wrong when deleting your festival."
      render :show
    end
  end

  private

  def festival_params
    params.require(:festival).permit(:id, :title, :start_time, :end_time, :location, :website_url)
  end
end
