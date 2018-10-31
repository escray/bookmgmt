class AddLogoToJournals < ActiveRecord::Migration[5.1]
  def change
    remove_column :journals, :image, :string
    add_column :journals, :logo, :string
  end
end
