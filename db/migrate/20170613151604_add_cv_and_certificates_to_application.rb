class AddCvAndCertificatesToApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :application, :cv, :string
    add_column :application, :certificates, :string
  end
end
