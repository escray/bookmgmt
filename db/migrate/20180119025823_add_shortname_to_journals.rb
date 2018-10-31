class AddShortnameToJournals < ActiveRecord::Migration[5.1]
  def change
    add_column :journals, :shortname, :string
    add_index :journals, :shortname, unique: true
  end
end
