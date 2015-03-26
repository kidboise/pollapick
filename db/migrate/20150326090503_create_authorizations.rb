class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.belongs_to :user, index: true
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.string :profile_page

      t.timestamps
    end
  end
end
