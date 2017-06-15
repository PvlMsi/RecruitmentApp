class CreateAvailableOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :available_offers do |t|
      t.string :offerName
    end
  end
end
