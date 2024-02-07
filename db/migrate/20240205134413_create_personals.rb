class CreatePersonals < ActiveRecord::Migration[7.1]
  def change
    create_table :personals do |t|
      t.string :nama_lengkap
      t.string :agama
      t.string :tempat_lahir
      t.string :jenis_kelamin
      t.string :domisili
      t.integer :no_kps
      t.integer :nik
      t.integer :nisn
      t.date :tanggal_lahir
      t.timestamps
    end
  end
end
