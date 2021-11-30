class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]
  before_action :set_recipe, only: [:new, :create]

  def new
     @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.recipe = @recipe
    if @review.save
      redirect_to recipe_path(@recipe.review)
    else
      render "new"
    end
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
