class CreateUsmSchoolInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :usm_school_informations do |t|
      t.string :asal_sekolah
      t.string :akreditas
      t.string :jurusan_sekolah
      t.integer :jumlah_pelajaran_un
      t.decimal :jumlah_nilai_un
      t.decimal :jumlah_pelajaran_semester5
      t.integer :jumlah_nilai_semester5
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
