class BlogCommentsController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = @blog.blog_comments.build(bc_params)
    @blog_comment.user_id = current_user.id
    @blog_comment.save
    redirect_to request.referer
    flash[:success] = 'コメントを送信しました！'
  end

  def destroy
    @blog_comment = BlogComment.find(params[:blog_id])
    @blog_comment.destroy
    redirect_to request.referer
    flash[:info] = 'コメントを削除しました。'
  end

  private
  def bc_params
    params.require(:blog_comment).permit(:image, :comment)
  end

end
