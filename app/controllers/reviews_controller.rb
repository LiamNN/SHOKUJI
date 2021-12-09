class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]
  before_action :set_recipe, only: [:new, :create]

  def new
    @review = Review.new
    if @recipe.photo.nil?
      @recipe.photo = "https://scontent.fmel14-2.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/190142158_932562257539177_6924772229027277610_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=ed5ff1&efg=eyJpIjoidCJ9&_nc_ohc=Zi227EIvdxAAX8o1PbW&tn=cSAD7cv6Xl1GU-x2&_nc_ht=scontent.fmel14-2.fna&oh=8ef34d5a54662edb89609269a48f9433&oe=61D3EDDE"
    end
  end

  def create
    @review = Review.new(review_params)
    @review.recipe = @recipe
    @review.user = current_user
    if @review.save
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Something went wrong."
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
