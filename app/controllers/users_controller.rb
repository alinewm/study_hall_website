class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @question = @user.questions.build if user_signed_in?
  end
end
