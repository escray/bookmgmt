class AddImagesToDocs < ActiveRecord::Migration[5.1]
  def change
    add_column :docs, :images, :string
  end
end
