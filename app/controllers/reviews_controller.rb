class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      body: review_params["body"],
      satisfaction: review_params["satisfaction"].to_i
      )
    if @review.save
      redirect_to restaurant_url(@review.restaurant)
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(
      body: review_params["body"],
      satisfaction: review_params["satisfaction"].to_i
      )
      redirect_to restaurant_url(@review.restaurant)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    restaurant_id = @review.restaurant_id
    @review.destroy
    redirect_to restaurant_url(restaurant_id)

  end

  private
  def review_params
    params.require(:review).permit(
      :body,
      :satisfaction
      )
  end
end
