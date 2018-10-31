class ChangeEditorToReferences < ActiveRecord::Migration[5.0]
  def change
    remove_column :docs, :editor
    add_reference :docs, :editor, index: true
    add_foreign_key :docs, :users, column: :editor_id
  end
end
