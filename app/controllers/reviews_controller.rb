class ReviewsController < ApplicationController
  def index
    @reviews = Reviews.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    review_params = params.require(:review).permit(:content, :rating)
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
