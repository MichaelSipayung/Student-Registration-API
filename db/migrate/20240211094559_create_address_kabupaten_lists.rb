class CreateAddressKabupatenLists < ActiveRecord::Migration[7.1]
  def change
    create_table :address_kabupaten_lists do |t|
      t.string :kabupaten
      t.references :address_province_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
