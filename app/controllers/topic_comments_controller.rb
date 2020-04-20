class TopicCommentsController < ApplicationController

  def create
  	@topic = Topic.find(params[:topic_id])
  	@topic_comment = @topic.topic_comments.build(tc_params)
  	@topic_comment.user_id = current_user.id
  	if @topic_comment.save
      render :index
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'コメントを送信できませんでした。'
  end

  def destroy
  	@topic_comment = TopicComment.find(params[:tc_id])
  	if @topic_comment.destroy
      @topic = Topic.find(params[:topic_id])
      render :index
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = 'コメントを削除できませんでした。'
  end

  private
  def tc_params
  	params.require(:topic_comment).permit(:image, :comment)
  end
end
