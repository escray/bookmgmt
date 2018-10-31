class AddArchivedAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :archived_at, :timestamp
  end
end
