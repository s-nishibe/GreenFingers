class SearchController < ApplicationController

  before_action :authenticate_user!

  def search
    if params[:search][:word] == ''
      redirect_to root_path
    end

    @split_words = params[:search][:word].split(/[[:blank:]]+/).select(&:present?)
    @negative_words, @positive_words =
      @split_words.partition {|split_word| split_word.start_with?('-')}

    @user = current_user
  	@new_user = User.new
  	@blog = Blog.new
  	@topic = Topic.new
    @model = params[:search][:model]

    @positive_words.each do |word|
      @datas = datas_none(@model)
      @datas_all = @datas.or(search_for(@model, word))
      @datas = @datas.or(search_for(@model, word).page(params[:page]))
    end

    @negative_words.each do |word|
      @datas.where!("name NOT LIKE ?", "%#{word.delete_prefix('-')}%")
    end
  end

  private
  def datas_none(model)
    if model == 'user'
      @datas = User.none
    elsif model == 'blog'
      @datas = Blog.none
    else model == 'topic'
      @datas = Topic.none
    end
  end

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
