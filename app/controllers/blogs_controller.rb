class BlogsController < ApplicationController
before_action :set_user, except: [:show]
before_action :set_blog, only: [:edit, :show, :update, :destroy]

def new
  @blog = Blog.new
  @plant = Plant.new
end

def create
  if params[:preview_btn]
    @blog = Blog.new
    @plant = Plant.find(params[:blog][:plant])
    @blog.title = params[:blog][:title]
    @blog.eyecatch_img = params[:blog][:eyecatch_img]
    @blog.weather = params[:blog][:weather]
    @blog.temperature = params[:blog][:temperature]
    @blog.plant_name = @plant.name
    @blog.plant_kind = @plant.kind
    @blog.tag_list = params[:blog][:tag_list]
    @blog.content = params[:blog][:content]
    render :preview
  elsif params[:draft_btn]
    @blog = current_user.blogs.build(blog_params)
    @plant = Plant.find(params[:blog][:plant])
    @blog.plant_name = @plant.name
    @blog.plant_kind = @plant.kind
    @blog.status = false
    if @blog.save
      redirect_to blog_path(@blog)
      flash[:success] = 'ブログを下書き保存しました。'
    else
      render :new
      flash[:danger] = 'ブログを保存できません。空欄になっている箇所はありませんか？'
    end
  else params[:blog_btn]
    @blog = current_user.blogs.build(blog_params)
    @plant = Plant.find(params[:blog][:plant])
    @blog.plant_name = @plant.name
    @blog.plant_kind = @plant.kind
    @blog.status = true
    if @blog.save
      redirect_to blog_path(@blog)
      flash[:success] = 'ブログを公開しました！'
    else
      render :new
      flash[:danger] = 'ブログを保存できません。空欄になっている箇所はありませんか？'
    end
  end
end

def preview
  @blog = Blog.new
end

def index
  if params[:tag_name]
    @tag = params[:tag_name]
    @blogs = Blog.tagged_with("#{params[:tag_name]}").where(status: true).order(updated_at: :DESC)
  elsif params[:page] == 'TL'
    @user = current_user
    @followers = @user.followings
    @blogs = Blog.where(user_id: @followers).order(updated_at: :DESC)
  elsif params[:page] == 'user_blogs'
    @user = User.find(params[:id])
    @blogs = @user.blogs.where(status: true).order(updated_at: :DESC)
  elsif params[:page] == 'drafts'
    @blogs = current_user.blogs.where(status: false).order(updated_at: :DESC)
  else params[:page] == 'all_blogs'
    @blogs = Blog.where(status: true).order(updated_at: :DESC)
  end
end

def edit
  @blog = Blog.find(params[:id])
  render :edit
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
    @blog = Blog.find(params[:id])
    @blog.status = false
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
      flash[:success] = '下書きを更新しました。'
    else
      render :new
      flash[:danger] = '下書きを更新できません。空欄になっている箇所はありませんか？'
    end
  else params[:blog_btn]
    @blog = Blog.find(params[:id])
    @blog.status = true
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
      flash[:success] = 'ブログを更新しました！'
    else
      render :new
      flash[:danger] = 'ブログを更新できません。空欄になっている箇所はありませんか？'
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

def blog_params
  params.require(:blog).permit(:user_id, :title, :content, :eyecatch_img, :tag_list)
end

end
