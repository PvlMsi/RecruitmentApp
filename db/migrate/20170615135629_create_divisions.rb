class CreateDivisions < ActiveRecord::Migration[5.0]
  def change
    create_table :divisions do |t|
      t.string :divisionName
    end
  end
end
