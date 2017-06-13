class AddCvAndCertificatesToApplication < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :cv, :string
    add_column :applications, :certificates, :string
  end
end
