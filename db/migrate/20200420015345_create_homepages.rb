class CreateHomepages < ActiveRecord::Migration[6.0]
  def change
    create_table :homepages do |t|
      t.references :organization, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
