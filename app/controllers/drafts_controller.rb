class DraftsController < ApplicationController
  before_action :set_user

  def new
  end

  def create
  end

  def index
  end

  def edit
  end

  def preview
  end

  def update
  end

  def destroy
  end

  def set_user
    @user = current_user
  end

  def draft_params
    params.require(:blog).permit(, :user_id, :title, :content, :eyecatch_img, :tag_list)
  end
end
