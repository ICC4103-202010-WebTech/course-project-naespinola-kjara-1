class RemoveGuestFromVotes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :votes, :guest, null: false, foreign_key: true
  end
end
