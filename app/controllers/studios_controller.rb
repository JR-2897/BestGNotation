class StudiosController < ApplicationController
  before_action :set_studio, only: [:show, :edit, :update, :destroy]
  before_action :check_for_studios, only: [:destroy]

  def index
    @studios = policy_scope(Studio)
    authorize @studios
  end

  def new
    @studio = Studio.new
    authorize @studio
  end

  def create
    @studio = Studio.new(studio_params)
    authorize @studio
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @studio.update(studio_params)
    redirect_to studio_path(@studio)
  end

  def destroy
    @studio.destroy
    redirect_to studios_path
  end

  private

  def set_studio
    @studio = Studio.find(params[:id])
    authorize @studio
  end

  def studio_params
    params.require(:studio).permit(:nameStudio, :dateCreated)
  end

  def check_for_studios
    @studio = Studio.find(params[:id])
    @games = Game.where(studio: @studio)
    @games_count = @games.count
    if @games_count != 0
      flash[:alert] = "Il existe au moins un jeu avec ce studio."
      redirect_to request.referrer
    end
  end
end
