class PagesController < ApplicationController

  def home
    @games = policy_scope(Game)
  end

  def dashboard
    @user = current_user
    @reviews = Review.where(user_id: @user.id)
  end

  def search
    @parameter = '%' + params[:search] + '%'
    if params[:type_search] == 'game'
      @games = Game.where("name LIKE :search", search: @parameter)
    elsif params[:type_search] == 'category'
      @categories = Category.where('"categoryName" LIKE :search', search: @parameter)
      @games = Game.where(category: @categories)
    elsif params[:type_search] == 'studio'
      @studios = Studio.where('"nameStudio" LIKE :search', search: @parameter)
      @games = Game.where(studio: @studios)
    elsif params[:type_search] == 'platform'
      @platforms = Platform.where('"platformName" LIKE :search', search: @parameter)
      @games = Game.where(platform: @platforms)
    end
    render 'home'
  end
end
