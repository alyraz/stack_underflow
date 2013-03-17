class Answer < ActiveRecord::Base
  attr_accessible :body

  validates :body,    presence: true, length: {minimum: 5}
  validates :user_id,     presence: true
  validates :question_id, presence: true
  
  belongs_to :user
  belongs_to :question
  has_many   :votes, as: :votable

  def aura_score
    Vote.where(:votable_id   => self.id, 
               :votable_type => self.class).
         sum(:value)
  end
end
