class SearchController < ApplicationController
  before_action :authenticate_user!
  def search
  	@user = User.new
  	@blog = Blog.new
  	@topic = Topic.new
  	@model = params[:search][:model]
  	@word = params[:search][:word]
  	@datas = search_for(@model, @word)
  end

  private
  def search_for(model, word)
  	if model == 'user'
  	  User.where("name LIKE ?", "%#{word}%")
  	elsif model == 'blog'
  	  Blog.where("title || content LIKE ?", "%#{word}%")
  	else model == 'topic'
  	  Topic.where("title LIKE ?", "%#{word}%")
    end
  end
end
