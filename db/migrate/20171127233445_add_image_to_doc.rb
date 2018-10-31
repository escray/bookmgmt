class AddImageToDoc < ActiveRecord::Migration[5.0]
  def change
    add_column :docs, :image, :string
  end
end
