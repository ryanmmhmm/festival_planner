class SkeletonController < ApplicationController

  def new
    @skeleton = Skeleton.new()
  end

  def create
    skeleton = Skeleton.new(skeleton_params)

    if skeleton.save
      redirect_to(skeleton_path(skeleton))
    else
      render :new
    end
  end

  def show

  end

  private

  def skeleton_params
    params.require(:skeleton).permit(:data)
  end
end
