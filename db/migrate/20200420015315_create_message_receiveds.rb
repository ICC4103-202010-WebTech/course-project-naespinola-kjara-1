class CreateMessageReceiveds < ActiveRecord::Migration[6.0]
  def change
    create_table :message_receiveds do |t|
      t.references :mailbox, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true


      t.timestamps
    end
  end
end
