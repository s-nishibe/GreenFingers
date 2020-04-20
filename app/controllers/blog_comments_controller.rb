class BlogCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = @blog.blog_comments.build(bc_params)
    @blog_comment.user_id = current_user.id
    if @blog_comment.save
      render :index
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'コメントを送信できませんでした。'
    end
  end

  def destroy
    @blog_comment = BlogComment.find(params[:bc_id])
    if @blog_comment.destroy
      @blog = Blog.find(params[:blog_id])
      render :index
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'コメントを破棄できませんでした。'
    end

  end

  private
  def bc_params
    params.require(:blog_comment).permit(:image, :comment)
  end

end
