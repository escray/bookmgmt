class AddDescToAttachments < ActiveRecord::Migration[5.1]
  def change
    add_column :attachments, :description, :string
  end
end
