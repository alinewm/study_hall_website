class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if user_signed_in?
      @question = @user.questions.build
      @feed_items = current_user.feed
    end
  end
end
