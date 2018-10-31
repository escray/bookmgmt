class AddImageToJournals < ActiveRecord::Migration[5.1]
  def change
    add_column :journals, :image, :string
  end
end
