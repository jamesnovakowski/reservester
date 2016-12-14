class ReservationsController < ApplicationController
	#before_action :set_restaurant, only: [:new]

  def new
  	@reservation = Reservation.new
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	
  end

  def create
    puts params
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  

end
