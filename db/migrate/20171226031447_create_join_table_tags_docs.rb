class CreateJoinTableTagsDocs < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tags, :docs do |t|
      t.index %i[tag_id doc_id]
      t.index %i[doc_id tag_id]
    end
  end
end
