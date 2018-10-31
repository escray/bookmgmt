#
class RenameCategoryToName < ActiveRecord::Migration[5.0]
  def change
    rename_column :docs, :category, :name
    rename_column :docs, :publish_date, :publish
  end
end
