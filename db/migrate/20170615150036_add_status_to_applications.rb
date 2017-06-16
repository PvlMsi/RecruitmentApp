class AddStatusToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :pending, :boolean, default: false
    add_column :applications, :positive, :boolean, default: false
    add_column :applications, :negative, :boolean, default: false
  end
end
