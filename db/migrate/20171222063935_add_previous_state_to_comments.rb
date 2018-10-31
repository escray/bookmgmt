class AddPreviousStateToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :previous_state, index: true
    add_foreign_key :comments, :states, column: :previous_state_id
  end
end
