class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :edit, :update, :destroy]

  def index
    @platforms = policy_scope(Platform)
    authorize @platforms
  end

  def new
    @platform = Platform.new
    authorize @platform
  end

  def create
    @platform = Platform.new(platform_params)
    authorize @platform
    if @platform.save
      redirect_to platform_path(@platform)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @platform.update(platform_params)
    redirect_to platform_path(@platform)
  end

  def destroy
    @platform.destroy
    redirect_to platforms_path
  end

  private

  def set_platform
    @platform = Platform.find(params[:id])
    authorize @platform
  end

  def platform_params
    params.require(:platform).permit(:platformName)
  end
end
