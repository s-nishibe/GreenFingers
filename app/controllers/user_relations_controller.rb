class UserRelationsController < ApplicationController
   before_action :set_user

  def follow
  	following = current_user.follow(user)
  	if following.save
  	  redirect_to user
  	  flash[:success] = 'ユーザをフォローしました！'
  	else
  	  redirect_to user
  	  flash[:info] = 'ユーザをフォローできませんでした。'
  	end
  end

  def unfollow
  	following = current_user.unfollow(user)
  	if following.destroy
  	  redirect_to user
  	  flash[:info] = 'ユーザのフォローを解除しました。'
  	else
  	  redirect_to user
  	  flash[:danger] = 'フォロー解除に失敗しました。'
  	end
  end

  private
  def set_user
  	user = User.find(params[:relationship][:follow_id])
  end
end
