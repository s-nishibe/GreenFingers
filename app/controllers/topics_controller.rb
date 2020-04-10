class TopicsController < ApplicationController
  before_action :set_user

  def new
  end

  def create
  end

  def index
    @topics = Topic.all
  end

  def edit
  end

  def show
  end

  def update
  end

  private
  def set_user
    @user = current_user
  end
end
