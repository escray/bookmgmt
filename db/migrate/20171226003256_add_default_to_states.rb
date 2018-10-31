class AddDefaultToStates < ActiveRecord::Migration[5.1]
  def change
    add_column :states, :default, :boolean, default: false
  end
end
