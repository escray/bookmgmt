class RemoveAttachmentFromDocs < ActiveRecord::Migration[5.0]
  def change
    remove_column :docs, :attachment, :string
  end
end
