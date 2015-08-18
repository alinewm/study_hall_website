class QuestionsController < ApplicationController
  # before_action :logged_in_user, only: [:create, :destroy]

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      AdminMailer.new_question_notifier.deliver_now(current_user, @question)
      flash[:success] = "Question created!"
      redirect_to root_url
    else
    @feed_items = []
    render 'pages/about'
    end
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end

end
