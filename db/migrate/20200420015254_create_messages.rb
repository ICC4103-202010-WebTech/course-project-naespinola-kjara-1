class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user_receiver
      t.references :user_transmitter
      t.string :text_message
      t.timestamps
    end


  end
end
