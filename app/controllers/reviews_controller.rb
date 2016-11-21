class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create, :show]
  #before_action :set_review, only: [:create, :update, :show]

  def new
  	@review = Review.new()
  	@restaurant
  end

  def create
  	#@review = Review.new(review_params)
  	@restaurant

  	@review = Review.new(review_params)
  	@review.user_id = current_user.id
  	@review.restaurant_id = @restaurant.id

  	#@review.restaurant_id = @restaurant.id 
  	#@review.user_id = current_user.id
    if @review.save
    	puts @review.inspect
      redirect_to @restaurant, notice: 'Review was successfully created.' 
    else
      render :new
    end
  end

  def show

  end

  def update
  end

  def delete
  end

  private 

  def set_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end


  def review_params
  	params.require(:review).permit(:restaurant_id, :rating, :text)
  end

end
