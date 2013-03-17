FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "John#{n}" }
    sequence(:email)    {|n| "user#{n}@example.com" }
    password                 "password"
    password_confirmation    "password"
  end

  factory :question do 
    title     "Question title"
    body      "Question body" * 5
    user
  end

  factory :question_with_winnerith_answers, :parent => :question do
    after(:create) do |question|
      3.times { create(:answer, :question => question) }
    end
  end

  factory :question_with_winner, :parent => :question_with_answers do
      winner { answers.sample }
  end
  
  factory :answer, :aliases => [:winner] do 
    body      "Answer body" * 5
    user
    question
  end

  factory :vote do 
    user
    votable { create([:question, :answer].sample) }
  end
end
