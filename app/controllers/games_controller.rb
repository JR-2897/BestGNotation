class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = policy_scope(Game)
  end

  def new
    @game = Game.new
    authorize @game
  end

  def create

    @game = Game.new(name: game_params[:name], description: game_params[:description],
      note: game_params[:note], datePublished: game_params[:datePublished])

    authorize @game

    @category = Category.where(categoryName: game_params[:category])
    @game.category = @category[0]

    @studio = Studio.where(nameStudio: game_params[:studio])
    @game.studio = @studio[0]

    @platform = Platform.where(platformName: game_params[:platform])
    @game.platform = @platform[0]

    if @game.save
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  def show
    @reviews = Review.where(game: @game)
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  private

  def set_game
    @game = Game.find(params[:id])
    authorize @game
  end

  def game_params
    params.require(:game).permit(:name, :description, :note, :datePublished, :category, :platform, :studio, :photo)
  end
end
