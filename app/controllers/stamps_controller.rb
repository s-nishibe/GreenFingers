class StampsController < ApplicationController
  before_action :authenticate_user!

  def create
  	@blog = Blog.find(params[:blog_id])
  	@stamp = @blog.stamps.build(stamp_params)
  	@stamp.user_id = current_user.id
  	if @stamp.save
      render :index
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'スタンプを押せませんでした。'
    end
  end

  def destroy
  	@blog = Blog.find(params[:blog_id])
  	@stamp_img = params[:stamp_img].to_i
  	@stamp = Stamp.find_by(user_id: current_user.id, stamp_img: @stamp_img)
  	if @stamp.destroy
      render :index
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'スタンプを消せませんでした。'
    end
  end

  private
  def stamp_params
  	params.permit(:stamp_img)
  end

end
