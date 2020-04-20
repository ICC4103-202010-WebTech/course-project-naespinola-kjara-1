class CreateMessageSents < ActiveRecord::Migration[6.0]
  def change
    create_table :message_sents do |t|
      t.references :mailbox, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
