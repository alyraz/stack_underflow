module QuestionHelper

  def current_user_upvote(question)
    begin
      current_user.upvote!(question)
    rescue ArgumentError => e
      # Airbrak.log(e,)
      flash[:notice] = "Sorry, something went wrong."
      redirect_to root_path
    end
  end

  def current_user_downvote(question)
    begin
      current_user.upvote!(question)
    rescue ArgumentError => e
      # Airbrak.log(e,)
      flash[:notice] = "Sorry, something went wrong."
      redirect_to root_path
    end
  end
end
