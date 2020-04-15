class PlantsController < ApplicationController
  before_action :set_user

  def create
  	@plant = @user.plants.build(plant_params)
    if @plant.save
      render :index
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    render :index
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    render :index
  end

  private
  def set_user
  	@user = current_user
  end

  def plant_params
  	params.require(:plant).permit(:user_id, :name, :kind, :memo)
  end
end
