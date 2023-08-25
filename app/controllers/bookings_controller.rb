class BookingsController < ApplicationController
  def new
    @boat = Boat.find(params[:boat_id])
    @booking = @boat.bookings.new(user: current_user)
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    @booking.boat = @boat
    @booking.user = current_user
    if @booking.save
      redirect_to confirmation_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if params[:booking][:end_date] > params[:booking][:start_date]
      @booking.update(booking_params)
      redirect_to confirmation_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    id = params[:id]
    Booking.destroy(id)
    redirect_to dashboard_path
  end

  def confirm
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :passengers)
  end
end
