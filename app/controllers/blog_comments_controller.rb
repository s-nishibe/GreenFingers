class BlogCommentsController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = @blog.blog_comments.build(bc_params)
    @blog_comment.user_id = current_user.id
    @blog_comment.save
    render :index
  end

  def destroy
    @blog_comment = BlogComment.find(params[:bc_id])
    @blog_comment.destroy
    @blog = Blog.find(params[:blog_id])
    render :index
  end

  private
  def bc_params
    params.require(:blog_comment).permit(:image, :comment)
  end

end
