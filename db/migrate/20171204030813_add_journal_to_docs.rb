class AddJournalToDocs < ActiveRecord::Migration[5.0]
  def change
    add_reference :docs, :journal, index: true, foreign_key: true
  end
end
