class TopicCommentsController < ApplicationController

  def create
  	@topic = Topic.find(params[:topic_id])
  	@topic_comment = @topic.topic_comments.build(tc_params)
  	@topic_comment.user_id = current_user.id
  	@topic_comment.save
  	redirect_to request.referer
  	flash[:success] = 'コメントを送信しました！'
  end

  def destroy
  	@topic_comment = TopicComment.find(params[:topic_id])
  	@topic_comment.destroy
  	redirect_to request.referer
  	flash[:info] = 'コメントを削除しました。'
  end

  private
  def tc_params
  	params.require(:topic_comment).permit(:image, :comment)
  end
end
