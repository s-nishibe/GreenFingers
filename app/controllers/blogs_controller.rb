class BlogsController < ApplicationController
before_action :authenticate_user!
before_action :set_user, except: [:show]

def new
  if @user.plants.exists?
    @blog = Blog.new
    @plant = Plant.new
  else
    redirect_to user_path(current_user)
    flash[:info] = '日記機能は花を登録してからご利用いただけます。さっそく花を登録してみましょう！'
  end
end

def create
  if params[:draft_btn]
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @blog.plant_id = params[:blog][:plant_id]
    @blog.status = false
    if @blog.save
      redirect_to blogs_path(sort: 'drafts')
      flash[:success] = '日記を下書き保存しました。'
    else
      flash[:danger] = '日記を保存できません。タイトルの文字数は1～100字、本文には2字以上が必要です。'
      render :new
    end
  else params[:blog_btn]
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @blog.plant_id = params[:blog][:plant_id]
    @blog.score = Language.get_data(blog_params[:body])
    @blog.status = true
    if @blog.save
      @user.score = @user.blogs.average(:score)
      @user.save
      redirect_to blog_path(@blog)
      flash[:success] = '日記を公開しました！ 下のツイートボタンで友達に知らせましょう！'
    else
      flash[:danger] = '日記を保存できません。タイトルの文字数は1～100字、本文には2字以上が必要です。'
      render :new
    end
  end
end

def preview
  @blog = Blog.new(blog_params)
end

def index
  if params[:tag_name]
    @tag = params[:tag_name]
    @blogs_all = Blog.is_published.tagged_with("#{params[:tag_name]}")
  elsif params[:sort] == 'TL'
    @timeline = @user.followings
    @blogs_all = Blog.is_published.where(user_id: @timeline)
  elsif params[:sort] == 'user_blogs'
    @user = User.find(params[:id])
    @blogs_all = @user.blogs.is_published
  elsif params[:sort] == 'drafts'
    @blogs_all = current_user.blogs.is_draft
  else params[:sort] == 'all_blogs'
    @blogs_all = Blog.is_published.includes(plant: :user)
  end

  @blogs = @blogs_all.page(params[:page])
end

def edit
  @blog = Blog.find(params[:id])
  if @blog.user_id != current_user.id
    redirect_back(fallback_location: root_path)
    flash[:danger] = 'お探しのページにはアクセスできません。'
  end
end

def show
  @blog = Blog.find(params[:id])
  # 他者の下書きを見られないようアクセス制限をかける
  if @blog.status == true || @blog.user_id == current_user.id
    @user = @blog.user
    @blog_comments = @blog.blog_comments
    @blog_comment = BlogComment.new
    @stamp = Stamp.new
  else
    redirect_back(fallback_location: root_path)
    flash[:danger] = 'お探しのページにはアクセスできません。'
  end
end

def update
  if params[:draft_btn]
    @blog = Blog.find(params[:id])
    @blog.status = false
    if @blog.update(blog_params)
      redirect_to blogs_path(sort: 'drafts')
      flash[:success] = '下書きを更新しました！'
    else
      flash[:danger] = '下書きを更新できません。空欄になっている箇所はありませんか？'
      render :new
    end
  else params[:blog_btn]
    @blog = Blog.find(params[:id])
    @blog.score = Language.get_data(blog_params[:body])
    @blog.status = true
    if @blog.update(blog_params)
      @user.score = @user.blogs.average(:score)
      @user.save
      redirect_to blog_path(@blog)
      flash[:success] = '日記を公開しました！ 下のツイートボタンから更新のお知らせをしましょう！'
    else
      flash[:danger] = '日記を更新できません。空欄になっている箇所はありませんか？'
      render :new
    end
  end
end

def destroy
  @blog = Blog.find(params[:id])
  if @blog.destroy
    if @user.blogs.exists?
       @user.score = @user.blogs.average(:score)
    else
       @user.score = 0
    end
    @user.save
    redirect_to blogs_path(sort: 'user_blogs', id: @user.id)
    flash[:info] = '日記を削除しました。'
  else
    redirect_back(fallback_location: root_path)
    flash[:danger] = '日記を削除できませんでした。'
  end
end

private
def set_user
	@user = current_user
end

def blog_params
  params.require(:blog).permit(:user_id, :plant_id, :title, :body, :eyecatch_img, :tag_list, :weather, :temperature, :water)
end

end
