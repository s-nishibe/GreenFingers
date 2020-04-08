class UsersController < ApplicationController
  before_action :set_user, only: [:idnex, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(user), success: '会員情報が更新されました！'
  end

  def destroy
    @user.destroy
    redirect_to homes_top_path, info: '退会処理は正常に行われました。ご利用ありがとうございました。'
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_img_id)
  end
end
