class User < ActiveRecord::Base
  EMAIL_REGEX = /.+@.+\..+/
  USERNAME_REGEX = /^\w+$/

  attr_accessible :username, :password, :password_confirmation, :email

  validates :password, :presence => true
  validates :email, :presence => true, :format => { :with => EMAIL_REGEX },
                    :uniqueness => { :case_sensitive => false }
  validates :username, :length => { :minimum => 4 }, 
                       :format => { :with => USERNAME_REGEX },
                       :uniqueness => { :case_sensitive => false }

  has_secure_password

  before_save { self.email.downcase! }
  before_save { self.username.downcase! }

  has_many :questions
  has_many :answers
  has_many :votes

  def upvote!(votable)
    vote!(votable, 1)    
  end

  def downvote!(votable)
    vote!(votable, -1)    
  end 

  private 
  def vote!(votable, value)
    raise ArgumentError unless [Question, Answer].include? votable.class
    self.votes.create(:votable => votable, :value => value)
  end
 
end


 # See: friendly_id gem
  # def to_param
  #   self.username
  # end
