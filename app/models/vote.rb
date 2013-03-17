class Vote < ActiveRecord::Base
  attr_accessible :votable, :value, :user
 
  validates :user_id,     presence: true
  validates :votable_id,  presence: true
  
  belongs_to :user
  belongs_to :votable, polymorphic: true  

end
