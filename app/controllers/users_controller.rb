class UsersController < ApplicationController
  before_filter :load_questions

  def create 
    @user = User.new params[:user]
    if @user.save
      login(@user.id)
      redirect_to questions_path
    else
      render 'questions/index' 
    end
  end

  def update
  end

  def destroy
  end
end
