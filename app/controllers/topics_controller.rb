class TopicsController < ApplicationController
  before_action :set_user

  def new
    @topic = Topic.new
    @topic_comment = @topic.topic_comments.build
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      @topic_comment = @topic.topic_comments.build(tc_params)
      @topic_comment.image = params[:topic][:topic_comment][:image]
      @topic_comment.comment = params[:topic][:topic_comment][:comment]
      @topic_comment.user_id = current_user.id
      if @topic_comment.save
        redirect_to topic_path(@topic.id)
        flash[:success] = '新しいトピックが立ちました！'
      else
        redirect_to topic_path(@topic.id)
        flash[:danger] = 'トピックのコメントを送信できませんでした。コメントの文字数は1字から500字です。'
      end
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'トピックを立てられません。タイトルの文字数は2字から100字です。'
    end
  end

  def index
    if params[:sort] == 'all_topics'
      @topics_all = Topic.includes(:topic_comments)
    elsif params[:sort] == 'user_topics'
      @user = User.find(params[:id])
      @topics_all = @user.topics.includes(:topic_comments)
    elsif params[:sort] == 'category'
      @category = params[:category].to_i
      @topics_all = Topic.where(category: @category).includes(:topic_comments)
    elsif params[:sort] == 'resolved'
      @topics_all = Topic.resolved.includes(:topic_comments)
    else params[:sort] == 'unsolved'
      @topics_all = Topic.unsolved.includes(:topic_comments)
    end

    @topics = @topics_all.page(params[:page])
  end

  def edit
    @topic = Topic.find(params[:id])
    if @topic.user_id != current_user.id
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'お探しのページにアクセスできませんでした。'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @topic_comments = @topic.topic_comments
    @topic_comment = TopicComment.new
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to topic_path(@topic)
      flash[:success] = 'トピックが更新されました！'
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'トピックを更新できませんでした。'
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      redirect_to topics_path(page: 'all_topics')
      flash[:info] = 'トピックが削除されました。'
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'トピックを削除できませんでした。'
    end
  end

  def status
    @topic = Topic.find(params[:id])
    if @topic.update(status_params)
       render :status
    else
       redirect_back(fallback_location: root_path)
       flash[:danger] = 'トピックのステータスを変更できませんでした。'
    end
  end

  private
  def set_user
    @user = current_user
  end

  def topic_params
    params.require(:topic).permit(:eyecatch_img, :title, :category, :user_id)
  end

  def tc_params
    params.permit(:image, :comment)
  end

  def status_params
    params.permit(:status)
  end

end
