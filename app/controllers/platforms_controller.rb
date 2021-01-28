class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :edit, :update, :destroy]
  before_action :check_for_platforms, only: [:destroy]

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

  def check_for_platforms
    @platform = Platform.find(params[:id])
    @games = Game.where(studio: @platform)
    @games_count = @games.count
    if @games_count != 0
      flash[:alert] = "Il existe au moins un jeu avec cette plateforme."
      redirect_to request.referrer
    end
  end
end
