class RemoveProfileIdFromSocialMediaAccounts < ActiveRecord::Migration
  def change
    rename_column :social_media_accounts, :profile_id, :user_id
  end
end
