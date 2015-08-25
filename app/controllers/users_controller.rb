class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    if user_signed_in?
      @question = @user.questions.build
      @feed_items = current_user.feed
    end
  end

  def edit
  end
end
