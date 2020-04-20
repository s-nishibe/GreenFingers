class HomesController < ApplicationController
  before_action :set_user

  def top
  	@blogs = Blog.all
  	@new_blogs = Blog.order(updated_at: :DESC).limit(5)
  	@featured_blogs = Blog.find(Stamp.group(:blog_id).order('count(blog_id) desc').limit(5).pluck(:blog_id))
  	@topics = Topic.where(status: false).order(updated_at: :DESC).limit(5)
  end

  def about
  end

  private
  def set_user
  	@user = current_user
  end

end
