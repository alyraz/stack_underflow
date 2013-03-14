class Answer < ActiveRecord::Base
  attr_accessible :body

  validates :body,    presence: true, length: {minimum: 5}
  validates :user_id,     presence: true
  validates :question_id, presence: true
  
  belongs_to :user
  belongs_to :question
  has_many   :votes, as: :votable
end
