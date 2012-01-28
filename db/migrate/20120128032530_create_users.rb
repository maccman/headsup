class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :uid
      t.string :google_token
      t.string :avatar_url
      t.text   :note
      t.timestamps
    end
  end
end
