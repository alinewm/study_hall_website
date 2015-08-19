class SolutionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @solution = @question.solutions.build(user_id: current_user.id)
    if @solution.save
      flash[:success] = "Solution created!"
    else
      flash[:danger] = "There was an error"
    end
  end

  def destroy
  end

end
