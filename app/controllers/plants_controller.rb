class PlantsController < ApplicationController
  before_action :set_user

  def create
  	@plant = @user.plant.build(plant_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_user
  	@user = current_user
  end

  def plant_params
  	params.require(:plant).permit(:user_id, :name, :type, :memo)
  end
end
