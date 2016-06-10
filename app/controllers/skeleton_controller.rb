class SkeletonController < ApplicationController

  def new
    @skeleton = Skeleton.new()
  end

  def create
    skeleton = Skeleton.new(params)
  end

  def show

  end
end
