class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = policy_scope(Game)
  end

  def new
    @game = Game.new
    @categories = Category.all
    @studios = Studio.all
    @platforms = Platform.all
    @game.category = @categories[0]
    @game.studio = @studios[0]
    @game.platform = @platforms[0]
    authorize @game
  end

  def create

    @game = Game.new

    authorize @game

    if update_game(game_params, @game)
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  def show
    @reviews = Review.where(game: @game)
  end

  def edit
    @categories = Category.all
    @studios = Studio.all
    @platforms = Platform.all
  end

  def update
    update_game(game_params, @game)
    redirect_to game_path(@game)
  end

  def update_game(game_params, game)

    @category = Category.find(game_params[:category])

    @studio = Studio.find(game_params[:studio])

    @platform = Platform.find(game_params[:platform])

    @game.update(name: game_params[:name], description: game_params[:description],
      note: game_params[:note], datePublished: game_params[:datePublished],
      category: @category, studio: @studio, platform: @platform, photo: game_params[:photo])
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
