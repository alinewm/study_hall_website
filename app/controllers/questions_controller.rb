class QuestionsController < ApplicationController

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      AdminMailer.new_question_notifier(current_user, @question).deliver_now
      flash[:success] = "Question created!"
      redirect_to root_url
    else
    @feed_items = []
    render 'pages/about'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end

end
