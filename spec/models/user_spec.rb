require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "#username" do
    let(:user) { FactoryGirl.create(:user) }

    it "is required" do
      user.username = nil
      expect(user).to be_invalid
    end

    it "has a minimum length of 2" do
      user.username = "a"
      expect(user).to be_invalid
    end

    it "has a maximum length of 20" do
      user.username = "a" * 21
      expect(user).to be_invalid
    end

    it "is unique" do
      user2 = FactoryGirl.create(:user)
      user2.username = user.username

      expect(user2).to be_invalid
    end
    
  end
end
