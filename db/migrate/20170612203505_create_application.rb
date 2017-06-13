class CreateApplication < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :jobType
    end
  end
end
