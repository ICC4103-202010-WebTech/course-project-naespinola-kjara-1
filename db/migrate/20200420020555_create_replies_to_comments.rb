class CreateRepliesToComments < ActiveRecord::Migration[6.0]
  def change
    create_table :replies_to_comments do |t|
      t.references :comment_receiver, null: false, foreign_key: true
      t.references :comment_transmitter, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
