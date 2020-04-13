class StampsController < ApplicationController

  def create
  	@blog = Blog.find(params[:blog_id])
  	@stamp = @blog.stamps.build(stamp_params)
  	@stamp.user_id = current_user.id
  	@stamp.save
  	redirect_back(fallback_location: root_path)
  	flash[:success] = 'スタンプを押しました！'
  end

  def destroy
  	@blog = Blog.find(params[:blog_id])
  	@stamp_img = params[:stamp_img].to_i
  	@stamp = Stamp.find_by(user_id: current_user.id, stamp_img: @stamp_img)
  	@stamp.destroy
  	redirect_back(fallback_location: root_path)
  	flash[:info] = 'スタンプを取り消しました。'
  end

  private
  def stamp_params
  	params.permit(:stamp_img)
  end

end
