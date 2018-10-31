class AddPrivateLevelToDocs < ActiveRecord::Migration[5.1]
  def change
    add_column :docs, :level, :string, default: 'sensitive'
  end
end
