class RemoveIncludeOrganizationFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :include_organization, :boolean
  end
end
