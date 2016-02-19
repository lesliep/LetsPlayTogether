require 'rails_helper'

RSpec.describe SocialMediaAccount, :type => :model do
  let(:social_media_account) { FactoryGirl.create(:social_media_account) }

  describe "#profile_id" do
    it "is required" do
      social_media_account.profile_id = nil

      expect(social_media_account).to be_invalid
    end
  end

  describe "#url" do
    it "is a maximum of 60 in length" do
      social_media_account.url = "http://" + "a" * 60 + ".com"

      expect(social_media_account).to be_invalid
    end
  end

  describe "#username" do
    it "is required" do
      social_media_account.username = nil

      expect(social_media_account).to be_invalid
    end

    it "is a maximum of 30 in length" do
      social_media_account.username = 'a' * 31

      expect(social_media_account).to be_invalid
    end

    it "is a minimum of 1 in length" do
      social_media_account.username = ''

      expect(social_media_account).to be_invalid
    end
  end

  describe "#provider" do
    it "is within the enum :provider" do
      expect{
      social_media_account.provider = 999999
      }.to raise_error ArgumentError
    end

    it "is required" do
      social_media_account.provider = nil

      expect(social_media_account).to be_invalid
    end
  end
end
