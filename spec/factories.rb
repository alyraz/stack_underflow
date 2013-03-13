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
    winner
  end

  factory :answer, :aliases => [:winner] do 
    body      "Answer body" * 5
    user
    question
  end

  factory :vote do 
    user
    votable { create(:question) }
  end
end
