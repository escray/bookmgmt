#
class CreateItems < ActiveRecord::Migration[5.1]
  def change
    drop_table :items if table_exists? :items
    create_table :items do |t|
      t.references :doc, index: true, foreign_key: true
      t.string :owner
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
