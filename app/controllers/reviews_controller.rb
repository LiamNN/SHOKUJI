class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]
  before_action :set_recipe, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def show
  end


  def new
     @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.recipe = @recipe
    if @review.save
      # redirect_to recipe_review_path(@recipe)
    else
      render "new"
    end
  end

  def destroy
    @review.destroy
    # redirect_to recipes_path(@recipe)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
