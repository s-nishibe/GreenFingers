class TopicsController < ApplicationController
  before_action :set_user, except: [:index]

  def new
    @topic = Topic.new
    @topic_comment = @topic.topic_comments.build
  end

  def create
    @topic = current_user.topics.build(topic_params)
    @topic.save
    @topic_comment = @topic.topic_comments.build
    @topic_comment.user_id = current_user.id
    @topic_comment.image = params[:topic][:topic_comment][:image]
    @topic_comment.comment = params[:topic][:topic_comment][:comment]
    @topic_comment.save
    redirect_to topic_path(@topic.id)
    flash[:success] = '新しいトピックが立ちました！'
  end

  def index
    @page = params[:page]
    if @page == 'all_topics'
      @user = current_user
      @topics = Topic.order(updated_at: :DESC)
    else @page == 'user_topics'
      @user = User.find(params[:id])
      @topics = @user.topics.order(updated_at: :DESC)
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find(params[:id])
    @topic_comments = @topic.topic_comments
    @topic_comment = TopicComment.new
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
    redirect_to topic_path(@topic)
    flash[:success] = 'トピックのタイトルが変更されました！'
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
    flash[:info] = 'トピックが削除されました。'
  end

  private
  def set_user
    @user = current_user
  end

  def topic_params
    params.require(:topic).permit(:eyecatch_img, :title, :category, :user_id)
  end

end
