class CreateWallOfComments < ActiveRecord::Migration[6.0]
  def change
    create_table :wall_of_comments do |t|
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
