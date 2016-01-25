class CreateSocialMediaAccounts < ActiveRecord::Migration
  def change
    create_table :social_media_accounts do |t|
      t.integer :provider
      t.string :username
      t.integer :profile_id

      t.timestamps null: false
    end
    add_index :social_media_accounts, [:username, :provider], unique: true
  end
end
