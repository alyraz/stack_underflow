class AnswersController < ApplicationController
  def create
    @answer = Answer.new params[:answer]
    @answer.question_id = params[:question_id]
    @answer.user = current_user
    if @answer.save
      # redirect_to :back
      redirect_to question_path(@answer.question)
    else
      render 'questions/show'
    end
  end

  def update
  end

  def destroy
  end
end
