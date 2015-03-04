class CreateProfilesTable < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :avatar_url
      t.string :location
      t.string :company_name
      t.integer :followers
      t.integer :following
      t.text :body
    end
  end
end
