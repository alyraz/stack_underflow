require 'spec_helper'

describe User do
  
  context '#valid?' do
    let!(:user)  { FactoryGirl.create(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should ensure_length_of(:username).is_at_least(4) }
    it { should_not allow_value("!- ada_$7").for(:username) }
    it { should allow_value("alysa765").for(:username) }
    it { should_not allow_value("blah").for(:email) }
    it { should allow_value("a@b.com").for(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
  end

  context 'associations' do
    it { should have_many(:questions) }
    it { should have_many(:answers) }
    it { should have_many(:votes) }
  end

  # context "#upvote!" do
  #   it "adds a vote to the database" do
  #     expect {
  #       user.upvote!(question)
  #     }.to change(Vote, :count).by(1)
  #   end
  # end
end
