class SolutionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @solution = current_user.solutions.build(params[:solution].merge :question_id => params[:question_id])
    if @solution.save
      flash[:success] = "Solution created!"
    else
      flash[:danger] = "There was an error"
    end
  end

  def destroy
  end

end
