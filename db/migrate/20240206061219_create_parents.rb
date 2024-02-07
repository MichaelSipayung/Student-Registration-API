class CreateParents < ActiveRecord::Migration[7.1]
  def change
    create_table :parents do |t|
      t.string :nama_ayah
      t.string :nama_ibu
      t.string :pendidikan_ayah
      t.string :pendidikan_ibu
      t.string :pekerjaan_ayah
      t.string :pekerjaan_ibu
      t.bigint :nik_ayah
      t.bigint :nik_ibu
      t.date :tanggal_lahir_ayah
      t.date :tanggal_lahir_ibu
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
