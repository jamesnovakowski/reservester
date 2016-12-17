class ReservationsController < ApplicationController
	before_action :set_restaurant, only: [:new, :create]

  def new
  	@reservation = Reservation.new
  	@restaurant
  end

  def create
    validated_params = reservation_params
    @reservation = Reservation.new(validated_params)
    @reservation[:user_id] = current_user.id
    @reservation[:restaurant_id] = params[:restaurant_id]
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @restaurant, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:num_guests, :comment, :res_date, :res_time, :restaurant_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end


end
