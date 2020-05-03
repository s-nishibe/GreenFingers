class TopicCommentsController < ApplicationController

  def create
  	@topic = Topic.find(params[:topic_id])
  	@topic_comment = @topic.topic_comments.build(tc_params)
  	@topic_comment.user_id = current_user.id
  	if @topic_comment.save
      render :index
    end
  end

  def destroy
  	@topic_comment = TopicComment.find(params[:tc_id])
  	if @topic_comment.destroy
      @topic = Topic.find(params[:topic_id])
      render :index
    end
  end

  private
  def tc_params
  	params.require(:topic_comment).permit(:image, :comment)
  end
end
