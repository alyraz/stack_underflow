require 'spec_helper'

describe Answer do
  
  context '#valid?' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:question_id) }
    it { should validate_presence_of(:user_id) }
    it { should ensure_length_of(:body).is_at_least(5) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
    it { should have_many(:votes) }
  end
end
