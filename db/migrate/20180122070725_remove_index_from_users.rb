class RemoveIndexFromUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :email, true
    # change_column_null :users, :username, false
    change_column_default :users, :cname, ''
    remove_index :users, name: :index_users_on_email
  end
end
