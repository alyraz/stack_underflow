class Vote < ActiveRecord::Base
 
  validates :user_id,     presence: true
  validates :votable_id,  presence: true
  
  belongs_to :user
  belongs_to :votable, polymorphic: true  

end
