class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

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
      update_note_game(@game)
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    update_note_game(@game)
    redirect_to game_path(@game)
  end

  def destroy
    @review.destroy
    redirect_to request.referrer
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

  def update_note_game(game)
    @notes = Array.new
    @game.reviews.each {|r| @notes.push(r.noteReview)}
    @game.update(note: CalculService.instance().CalculateDecimalAverage(@notes))
  end
end
