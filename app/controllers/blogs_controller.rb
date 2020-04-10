class BlogsController < ApplicationController
before_action :set_user
before_action :set_blog, only: [:edit, :show, :destroy]


def index
  @blogs = Blog.all
end

def edit
end

def show
  @blog = Blog.find(params[:id])
  @user = @blog.user
end

def update
end

def destroy
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
