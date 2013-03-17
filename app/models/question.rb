class Question < ActiveRecord::Base
  attr_accessible :title, :body, :user_id

  validates :body, presence: true, length: {minimum: 20}
  validates :user_id, presence: true
  validates :title, presence: true, length: {minimum: 10}

  has_many   :answers
  has_many   :votes, as: :votable
  belongs_to :user 
  belongs_to :winner

  def aura_score
    # votes = q.votes
    # score = 0
    # votes.each do |vote|
    #   score += vote.value 
    # end 
    # score 

    Vote.where(:votable_id   => self.id, 
               :votable_type => self.class).
         sum(:value)
  end


end
