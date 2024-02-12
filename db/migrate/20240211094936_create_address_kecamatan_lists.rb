class CreateAddressKecamatanLists < ActiveRecord::Migration[7.1]
  def change
    create_table :address_kecamatan_lists do |t|
      t.string :kecamatan
      t.references :address_kabupaten_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
