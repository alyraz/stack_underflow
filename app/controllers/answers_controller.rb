class AnswersController < ApplicationController
  before_filter :load_question
  
  def create
    @answer = @question.answers.build params[:answer]
    @answer.user = current_user
    if @answer.save
      redirect_to @question #== question_path(@question)
    else
      render 'questions/show'
    end
  end

  def update
  end

  def destroy
  end

  private
  def load_question
    @question = Question.find params[:question_id]    
  end
end
