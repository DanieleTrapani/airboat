class BookingsController < ApplicationController
  def new
    @boat = Boat.find(params[:boat_id])
    @booking = @boat.bookings.new(user: current_user)
  end

  def create
    @boat = Boat.find(params[:boat_id])
    booking = Booking.new(booking_params)
    booking.boat = @boat
    booking.user = current_user
    booking.save
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    booking = Booking.find(params[:id])
    booking.update(booking_params)
  end

  def destroy
    id = params[:id]
    Booking.destroy(id)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
