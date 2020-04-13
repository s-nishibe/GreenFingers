class BlogsController < ApplicationController
before_action :set_user
before_action :set_blog, only: [:edit, :show, :update, :destroy]


def index
  if params[:tag_name]
    @tag = params[:tag_name]
    @blogs = Blog.tagged_with("#{params[:tag_name]}")
  else
    @blogs = Blog.all
  end
end

def edit
  @blog = Blog.find(params[:id])
end

def show
  @blog = Blog.find(params[:id])
  @user = @blog.user
  @blog_comments = @blog.blog_comments
  @blog_comment = BlogComment.new
  @stamp = Stamp.new
end

def update
  if params[:draft_btn]
  	@draft = Draft.new
  	@draft.user_id = current_user.id
  	@draft.eyecatch_img = @blog.eyecatch_img
  	@draft.title = @blog.title
  	@draft.tag_list = @blog.tag_list
  	@draft.content = @blog.content
  	if @draft.save(save_params)
  	  @blog.destroy
  	  redirect_to drafts_path
  	  flash[:info] = '記事を下書きに戻しました。'
    else
      render :edit
      flash[:danger] = '記事を下書きに戻せません。タイトルや本文の文字数は適切ですか？'
    end
  elsif params[:blog_btn]
    if @blog.update(save_params)
    redirect_to blog_path(@blog)
    flash[:success] = 'ブログが更新されました！'
    else
      render :edit
      flash[:danger] = '記事を更新できません。タイトルや本文の文字数は適切ですか？'
    end
  end
end

def destroy
  @blog = Blog.find(params[:id])
  @blog.destroy
  redirect_to blogs_path
  flash[:info] = 'ブログ記事を削除しました。'
end

private
def set_user
	@user = current_user
end

def set_blog
  @blog = Blog.find(params[:id])
end

def save_params
  params.require(:blog).permit(:user_id, :title, :content, :eyecatch_img, :tag_list)
end

end
