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
    if note_validation(review_params[:noteReview].to_f)
      @review.user = current_user
      if @review.save
        update_note_game(@game)
        redirect_to game_path(@game)
      else
        render 'new'
      end
    else
      redirect_to request.referrer
    end
  end

  def edit
  end

  def update
    if note_validation(review_params[:noteReview].to_f)
      @review.update(review_params)
      update_note_game(@game)
      redirect_to game_path(@game)
    else
      redirect_to request.referrer
  end
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

  def note_validation(note)
    if note <= -0.1 || note >=20.1
      flash[:alert] = "La note saisi n'est pas comprise entre 0.0 et 20.0. Valeur saisie: " + note.to_s
      return false
    end
    return true
  end 
end
