module ApplicationHelper
  def load_questions
    @questions = Question.all
  end
end
