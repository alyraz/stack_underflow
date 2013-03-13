require 'spec_helper'

describe Question do
  
  context '#valid?' do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user_id) }
    it { should ensure_length_of(:body).is_at_least(20) }
    it { should ensure_length_of(:title).is_at_least(10) }
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:answers) }
    it { should have_many(:votes) }
  end
end
