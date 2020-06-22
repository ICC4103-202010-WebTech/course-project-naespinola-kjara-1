class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.boolean :in_blacklist, default: false
      t.string :name
      t.string :last_name
      t.string :image, default: ""
      t.string :short_bio
      t.string :location

      t.timestamps
    end
  end
end
