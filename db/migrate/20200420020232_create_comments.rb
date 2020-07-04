class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :rich_text

      t.timestamps
    end
  end
end
