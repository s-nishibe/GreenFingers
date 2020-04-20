class PlantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def create
  	@plant = @user.plants.build(plant_params)
    if @plant.save
      render :index
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = '花を登録できませんでした。'
    end
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
    else
      redirect_back(fallback_location: root_path)
      flash[:success] = '花の情報を更新しました！'
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    if @plant.destroy
      render :index
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = '花の情報を破棄できませんでした。'
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
