class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :check_for_categories, only: [:destroy] 
  def index
    @categories = policy_scope(Category)
    authorize @categories
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  def destroy
      @category.destroy
      redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
    authorize @category
  end

  def category_params
    params.require(:category).permit(:categoryName)
  end

  def check_for_categories
    @category = Category.find(params[:id])
    @games = Game.where(category: @category)
    @games_count = @games.count
    if @games_count != 0
      flash[:alert] = "Il existe au moins un jeu avec cette catégorie."
      redirect_to request.referrer
    end
  end
end