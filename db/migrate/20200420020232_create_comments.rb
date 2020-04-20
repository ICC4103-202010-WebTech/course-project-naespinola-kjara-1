class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :wall_of_comment, null: false, foreign_key: true
      t.string :rich_text
      t.string :image

      t.timestamps
    end
  end
end
