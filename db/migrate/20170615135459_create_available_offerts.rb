class CreateAvailableOfferts < ActiveRecord::Migration[5.0]
  def change
    create_table :available_offerts do |t|
      t.string :offerName
    end
  end
end
