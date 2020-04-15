class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:following_id])
    following = current_user.follow(@user)
    if following.save
      render :index
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました。'
    end
  end

  def destroy
    @user = User.find(params[:id])
    following = current_user.unfollow(@user)
    if following.destroy
      render :index
    else
      flash.now[:alert] = 'フォロー解除に失敗しました。'
    end
  end

end
