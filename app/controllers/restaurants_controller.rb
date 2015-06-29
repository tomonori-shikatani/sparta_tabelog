class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @restaurants = Restaurant.page(params[:page])
    if current_user.name.include?("kodama")||current_user.name.include?("Kodama")||current_user.name.include?("KODAMA")||current_user.name.include?("小玉")||current_user.name.include?("こだま")||current_user.name.include?("コダマ")||current_user.gender == false
 #     @picture = "female2.jpg"
      @class = "img1"
    else
#       @picture = "hooters1.jpg"
       @class= "img2"
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
    redirect_to restaurant_url(@restaurant)
    else
    render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_url(@restaurant)
    else
      render :edit
    end

  end

  def destroy

  end

  private

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :tel,
      :address,
      :web_url
      )
  end
end
