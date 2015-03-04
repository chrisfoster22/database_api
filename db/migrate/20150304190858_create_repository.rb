class CreateRepository < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :url
      t.integer :forks
      t.integer :stars
      t.datetime :git_updated
      t.string :language
      t.integer :repository_list_id
      t.text :body
    end
  end
end
