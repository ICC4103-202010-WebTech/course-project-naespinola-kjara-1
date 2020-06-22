class AddOrganizationToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :organization, null: false, foreign_key: true
  end
end
