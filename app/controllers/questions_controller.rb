class QuestionsController < ApplicationController
  before_filter :load_questions

  def index
  end

  def create
    @question = Question.new params[:question]
    if @question.save
      redirect_to @question
    else 
      render 'index'
    end 
  end

  def update
  end

  def show
  end

  def destroy
  end
end
