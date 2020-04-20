class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user_receiver, null: false, foreign_key: true
      t.references :user_transmitter, null: false, foreign_key: true
      t.string :text_message

      t.timestamps
    end
  end
end
