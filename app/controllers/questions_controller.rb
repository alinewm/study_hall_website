class QuestionsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      current_user.use_question!
      AdminMailer.new_question_notifier(current_user, @question).deliver_now
      flash[:notice] = "Question created!"
      redirect_to request.referrer || root_url
    else
      @feed_items = []
    render 'users/show'
    end
  end

  def show
    @question = Question.find(params[:id])
    if user_signed_in?
      @user = current_user
      @solution = @user.solutions.build
    end
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:content, :picture)
  end

end
