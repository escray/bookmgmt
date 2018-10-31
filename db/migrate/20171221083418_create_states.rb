class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :color

      t.timestamps
    end

    add_reference :docs, :state, index: true, foreign_key: true
    add_reference :comments, :state, foreign_key: true
  end
end
