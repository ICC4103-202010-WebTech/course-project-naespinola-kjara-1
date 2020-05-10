class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.boolean :private
      t.boolean :include_organization
      t.string :image
      t.string :videos
      t.string :documents
      t.string :location

      t.timestamps
    end
  end
end
