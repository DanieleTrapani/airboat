class BoatsController < ApplicationController

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user_id = current_user.id
    if @boat.save
      redirect_to boat_path(@boat)
      raise
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :brand, :engine, :pickup_address, :year, :capacity, :cost)
  end
end
