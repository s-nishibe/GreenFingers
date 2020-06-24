class HomesController < ApplicationController
  before_action :set_user

  def top
  	@blogs = Blog.all
  	@new_blogs = Blog.is_published.limit(5)
  	@featured_blogs = Blog.find(Stamp.group(:blog_id).order('count(blog_id) desc').limit(5).pluck(:blog_id))
  	@topics = Topic.unsolved.limit(5)
  end

  def about
  end

  def rank
    @good = Blog.find(Stamp.where(stamp_img: 1).group(:blog_id).order('count(blog_id) desc').limit(5).pluck(:blog_id))
    # @useful
    # @funny
    # @star
    # @thanks
  end

  private
  def set_user
  	@user = current_user
  end

end
