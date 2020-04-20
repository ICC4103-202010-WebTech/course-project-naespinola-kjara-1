class CreateDatesToVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :dates_to_votes do |t|
      t.references :event, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
