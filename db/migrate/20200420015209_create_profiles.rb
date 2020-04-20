class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :image
      t.string :document
      t.string :video
      t.string :short_bio
      t.string :name
      t.string :last_name

      t.timestamps
    end
  end
end
