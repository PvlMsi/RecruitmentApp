class AddDivisionToApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :division, :string
    add_column :applications, :technologies, :text
    add_column :applications, :created_at, :timezone
  end
end
