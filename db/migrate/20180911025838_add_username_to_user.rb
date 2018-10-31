#
class AddUsernameToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :username if column_exists?(:users, :username)
    add_column :users, :username, :string
  end
end
