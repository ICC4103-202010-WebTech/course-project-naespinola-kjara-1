class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :image
      t.string :rich_text
      t.string :description
      t.string :videos
      t.string :documents
      t.string :pictures

      t.timestamps
    end
  end
end
