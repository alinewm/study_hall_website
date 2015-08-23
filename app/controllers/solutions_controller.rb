class SolutionsController < ApplicationController
  before_action :authenticate_user!

  def create
    solution = current_user.solutions.build(solution_params)
    if solution.save
      question = Question.find(params[:question_id])
      UserMailer.question_replied_notifier(current_user, question).deliver_now
      flash[:notice] = "Solution created!"
    else
      flash[:alert] = "There was an error"
    end
    redirect_to request.referrer || root_url
  end

  def destroy
  end

  private

  def solution_params
    params.require(:solution).permit(:content).merge(question_id: params[:question_id])
  end

end
