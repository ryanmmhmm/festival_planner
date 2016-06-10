class SkeletonController < ApplicationController

  def index
    @skeletons = Skeleton.all
  end

  def new
    @skeleton = Skeleton.new()
  end

  def create
    skeleton = Skeleton.new(skeleton_params)

    if skeleton.save
      redirect_to skeleton_index_path
    else
      render :new
    end
  end

  def show
    @skeleton = Skeleton.find(params[:id])
  end

  private

  def skeleton_params
    params.require(:skeleton).permit(:data)
  end
end
