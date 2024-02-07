class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :provinsi
      t.string :kabupaten
      t.string :kecamatan
      t.string :kelurahan
      t.string :alamat
      t.integer :kode_pos
      t.bigint :no_telepon
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
