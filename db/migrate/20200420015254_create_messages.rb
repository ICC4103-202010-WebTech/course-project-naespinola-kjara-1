class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user_receiver, null: false, foreign_key: true
      t.references :user_transmitter, null: false, foreign_key: true
      t.string :text_message

      add_foreign_key :messages, :users, column: :user_receiver_id, primary_key: :id
      add_foreign_key :messages, :users, column: :user_transmitter_id, primary_key: :id

      t.timestamps
    end
  end
end
