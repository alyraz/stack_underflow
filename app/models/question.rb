class Question < ActiveRecord::Base
  attr_accessible :title, :body, :user_id

  validates :body, presence: true, length: {minimum: 20}
  validates :user_id, presence: true
  validates :title, presence: true, length: {minimum: 10}

  has_many   :answers
  has_many   :votes, as: :votable
  belongs_to :user 


end
