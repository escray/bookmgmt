class AddAttachmentToDocs < ActiveRecord::Migration[5.0]
  def change
    add_column :docs, :attachment, :string
  end
end
