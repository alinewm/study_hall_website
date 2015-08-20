class SolutionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @solution = current_user.solutions.build(solution_params)
    if @solution.save
      flash[:success] = "Solution created!"
    else
      flash[:danger] = "There was an error"
    end
    redirect_to root_url
  end

  def destroy
  end

  private

  def solution_params
    params.require(:solution).permit(:content).merge(question_id: params[:question_id])
  end

end
