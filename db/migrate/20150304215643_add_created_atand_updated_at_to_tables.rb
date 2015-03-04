class AddCreatedAtandUpdatedAtToTables < ActiveRecord::Migration
  def change
    add_column :profiles, :created_at, :timestamp
    add_column :profiles, :updated_at, :timestamp
    add_column :repositories, :created_at, :timestamp
    add_column :repositories, :updated_at, :timestamp
  end
end
