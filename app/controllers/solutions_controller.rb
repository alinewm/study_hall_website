class SolutionsController < ApplicationController
  before_action :authenticate_user!

  def create
    params[:solution].merge!(:question_id => params[:question_id])
    @solution = (params[:solution])
    if @solution.save
      flash[:success] = "Solution created!"
    else
      flash[:danger] = "There was an error"
    end
  end

  def destroy
  end

end
