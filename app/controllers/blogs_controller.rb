class BlogsController < ApplicationController
before_action :set_blog, only: [:edit, :show, :destroy]

def create
  @blog = Blog.new
  @blog.user.id = current_user.id
  @blog.save
  redeirect_to blog_path(@blog)
  flash[:success] = 'ブログが公開されました！'
end

def index
  @blogs = Blog.all
end

def edit
end

def show
end

def update
end

def destroy
end

private
def set_blog
  @blog = Blog.find(params[:id])
end

end
