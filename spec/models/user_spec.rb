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

  context "#upvote!" do
    let(:user)      { FactoryGirl.create(:user) }
    let(:question)  { FactoryGirl.create(:question) }
    let(:answer)    { FactoryGirl.create(:answer) }

    it "doesn't accept non-votables" do
      expect { user.upvote!(user) }.to raise_error
      expect { user.upvote!("pants") }.to raise_error
    end 

    it "upvoting a question adds a vote to the database" do
      expect {
        user.upvote!(question)
      }.to change(Vote, :count).by(1)
    end

    it "upvoting an answer adds a vote to the database" do
      expect {
        user.upvote!(answer)
      }.to change(Vote, :count).by(1)
    end
  end

  context "#downvote!" do  
    let(:user)      { FactoryGirl.create(:user) }
    let(:question)  { FactoryGirl.create(:question) }
    let(:answer)    { FactoryGirl.create(:answer) }
    
    it "doesn't accept non-votables" do 
      expect { user.downvote!(user) }.to raise_error
      expect { user.downvote!("pants") }.to raise_error
    end 

    it "upvoting a question adds a vote to the database" do
      expect {
        user.downvote!(question)
      }.to change(Vote, :count).by(1)
    end

    it "upvoting an answer adds a vote to the database" do
      expect {
        user.downvote!(answer)
      }.to change(Vote, :count).by(1)
    end
  end 

end
