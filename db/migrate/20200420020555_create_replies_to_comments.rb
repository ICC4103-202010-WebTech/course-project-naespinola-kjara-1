class CreateRepliesToComments < ActiveRecord::Migration[6.0]
  def change
    create_table :replies_to_comments do |t|
      t.references :comment_receiver
      t.references :comment_transmitter
      t.timestamps
    end
    add_foreign_key :replies_to_comments, :comments, column: :comment_receiver_id, primary_key: :id
    add_foreign_key :replies_to_comments, :comments, column: :comment_transmitter_id, primary_key: :id
  end
end
