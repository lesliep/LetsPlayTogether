require 'rails_helper'

RSpec.describe Profile, :type => :model do
  let(:profile) { FactoryGirl.create(:profile) }

  describe "#display_name" do
    it "has a minimum length of 2" do
      profile.display_name = "a"

      expect(profile).to be_invalid
    end

    it "has a maximum length of 20" do
      profile.display_name = "a" * 21

      expect(profile).to be_invalid
    end

    it "is required" do
      profile.display_name = nil

      expect(profile).to be_invalid
    end
  end

  describe "#user_id" do
    it "is required" do
      profile.user_id = nil

      expect(profile).to be_invalid
    end
  end

  # website
  # byline
end
