class FestivalsController < ApplicationController
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

  private

  def festival_params
    params.require(:festival).permit(:id, :title, :start_time, :end_time, :location, :website_url)
  end
end
