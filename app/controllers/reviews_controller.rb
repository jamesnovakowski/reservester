class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create, :show, :destroy]
  before_action :set_review, only: [:edit, :update, :show, :destroy]

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

  def edit
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @restaurant, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to @restaurant, notice: 'Review was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private 

  def set_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
  	params.require(:review).permit(:restaurant_id, :rating, :text)
  end

end
