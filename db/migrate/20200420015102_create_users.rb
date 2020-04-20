class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :username
      t.string :email
      t.string :password
      t.boolean :is_organization_admin
      t.boolean :is_system_admin
      t.boolean :in_blacklist

      t.timestamps
    end
  end
end
