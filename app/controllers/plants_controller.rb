class PlantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def create
  	@plant = @user.plants.build(plant_params)
    if @plant.save
       render :index
    end
  end

  def show
    @plant = Plant.find(params[:id])
    @user = @plant.user
    @blogs = @plant.blogs
  end

  def edit
    @plant = Plant.find(params[:id])
    if @plant.user_id != current_user.id
      redirect_back(fallback_location: root_path)
      flash[:danger] = '花の情報を編集できません。'
    end
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(plant_params)
      render :index
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    if @plant.destroy
      render :index
    end
  end

  private
  def set_user
  	@user = current_user
  end

  def plant_params
  	params.require(:plant).permit(:user_id, :name, :kind, :memo)
  end
end
