class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user_receiver
      t.references :user_transmitter
      t.timestamps
    end

    add_foreign_key :messages, :users, column: :user_receiver_id, primary_key: :id
    add_foreign_key :messages, :users, column: :user_transmitter_id, primary_key: :id

  end
end
