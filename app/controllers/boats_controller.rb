class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

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
    # TODO: Temporary solution to avoid breaking
    @boat.img_url = "https://loremflickr.com/320/240/yacht?#{@boat.name}"
    if @boat.save
      redirect_to boat_path(@boat)
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
