class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @game = Game.find(params[:game_id])
    @reviews = policy_scope(Review).where(game: @game)
    authorize @reviews
  end

  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @game = Game.find(params[:game_id])
    @review.game = @game
    authorize @review
    @review.user = current_user
    if @review.save
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to game_path(@game)
  end

  def destroy
    @review.destroy
    redirect_to game_path(@game)
  end

  private

  def set_review
    @review = Review.find(params[:id])
    @game = Game.find(params[:game_id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:noteReview, :description)
  end
end
