class PlantsController < ApplicationController
  before_action :set_user

  def create
  	@plant = @user.plant.build(plant_params)
    @plant.save
    redirect_back(fallback_location: root_path)
  end

  def edit
    @plant.find(params[:id])
  end

  def update
    @plant.find(params[:id])
    @plant.update(plant_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @plant.find(params[:id])
    @plant.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_user
  	@user = current_user
  end

  def plant_params
  	params.require(:plant).permit(:user_id, :name, :type, :memo)
  end
end
