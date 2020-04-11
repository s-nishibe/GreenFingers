class TopicsController < ApplicationController
  before_action :set_user

  def new
    @topic = Topic.new
    @topic_comment = TopicComment.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id
    @topic.save
    @topic_comment = TopicComment.new
    @topic_comment.user_id = current_user.id
    @topic_comment.topic_id = @topic.id
    @topic_comment.image = params[:topic][:topic_comment][:image]
    @topic_comment.comment = params[:topic][:topic_comment][:comment]
    @topic_comment.save
    redirect_to topic_path(@topic)
    flash[:success] = '新しいトピックが立ちました！'
  end

  def index
    @topics = Topic.all
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find(params[:id])
    @topic_comments = @topic.topic_comments
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
    params.require(:topic).permit(:eyecatch_img, :title, :user_id)
  end

end
