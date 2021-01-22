class PagesController < ApplicationController

  def home
    @games = policy_scope(Game)
  end

  def dashboard
    @user = current_user
    @reviews = Review.where(user_id: @user.id)
  end

end
