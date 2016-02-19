class AddUrlToSocialMediaAccounts < ActiveRecord::Migration
  def change
    add_column :social_media_accounts, :url, :string
  end
end
