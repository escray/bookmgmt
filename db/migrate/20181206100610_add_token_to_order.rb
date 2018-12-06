class AddTokenToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :token, :string
  end
end
