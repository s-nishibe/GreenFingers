class HomesController < ApplicationController
  before_action :set_user

  def top
  end

  def about
  end

  private
  def set_user
  	@user = current_user
  end

end
