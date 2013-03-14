class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email]) 

    if @user && @user.authenticate(params[:password])
      login(@user.id)
      redirect_to root_path
    else
      render 'home'
    end
  end

  def destroy
    logout
    redirect_to questions_path
  end
end
