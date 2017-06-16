class ChangeApplicationStatusDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:applications, :pending, false )
    change_column_default(:applications, :negative, false )
  end
end
