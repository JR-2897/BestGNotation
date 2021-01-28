class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = policy_scope(Game)
    authorize @games
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
      datePublished: Date.new(game_params[:'datePublished(1i)'].to_i,game_params[:'datePublished(2i)'].to_i, game_params[:'datePublished(3i)'].to_i),
       photo: game_params[:photo], category: @category, studio: @studio, platform: @platform)
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
    params.require(:game).permit(:name, :description, :datePublished, :category, :platform, :studio, :photo)
  end
end
