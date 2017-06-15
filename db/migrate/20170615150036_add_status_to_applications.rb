class AddStatusToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :pending, :boolean, defaul: false
    add_column :applications, :positive, :boolean, default: false
    add_column :applications, :negative, :boolean, defaul: false
  end
end
