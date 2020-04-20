class CreateRepliesToComments < ActiveRecord::Migration[6.0]
  def change
    create_table :replies_to_comments do |t|
      t.references :comment_receiver, null: false, foreign_key: true
      t.references :comment_transmitter, null: false, foreign_key: true

      add_foreign_key :replies_to_comments, :comments, column: :comment_receiver_id, primary_key: :id
      add_foreign_key :replies_to_comments, :comments, column: :comment_transmitter_id, primary_key: :id
      t.timestamps
    end
  end
end
