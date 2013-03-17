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
    @question = Question.find params[:id]
    send("current_user_#{params[:action]}", @question)

    @question.send(params[:action])

    # if params[:value] == 1
    #   current_user_upvote(@question)
    # else
    #   current_user_downvote(@question)
    # end
    render :json => { aura: @question.aura_score }
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
  end
end
