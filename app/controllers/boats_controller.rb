class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

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
    # @boat.img_url = "https://loremflickr.com/320/240/yacht?#{@boat.name}"
    @boat.img_url = "https://images.unsplash.com/photo-1600177897995-e67c73ed44e9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHlhY2h0fGVufDB8fDB8fHww&auto=format&fit=crop&w=1000&q=60"

    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    redirect_to dashboard_path, status: :see_other
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :brand, :engine, :pickup_address, :year, :capacity, :cost)
  end
end
