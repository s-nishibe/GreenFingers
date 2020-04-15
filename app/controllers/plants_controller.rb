class PlantsController < ApplicationController
  before_action :set_user

  def create
  	@plant = @user.plants.build(plant_params)
    if @plant.save
      render :index
      flash[:success] = '新しい花が登録されました！'
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = '花の登録に失敗しました。'
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    redirect_to user_path(@user)
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to user_path(@user)
  end

  private
  def set_user
  	@user = current_user
  end

  def plant_params
  	params.require(:plant).permit(:user_id, :name, :name, :memo)
  end
end
