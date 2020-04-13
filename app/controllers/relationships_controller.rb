class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:following_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました！'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました。'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @user = User.find(params[:id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:info] = 'フォローを解除しました。'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = 'フォロー解除に失敗しました。'
      redirect_back(fallback_location: root_path)
    end
  end

end
