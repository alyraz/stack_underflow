class QuestionsController < ApplicationController
  def index
  end

  def create
    @question = Question.new params[:question]
    if @question.save
      redirect_to question_path(@question)
    else 
      render 'index'
    end 
  end

  def update
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
  end
end
