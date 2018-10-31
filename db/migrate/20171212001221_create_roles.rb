class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    drop_table(:roles, if_exists: true)
    create_table :roles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :role
      t.references :journal, index: true, foreign_key: true

      t.timestamps
    end
  end
end
