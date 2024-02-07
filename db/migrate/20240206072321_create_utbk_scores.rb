class CreateUtbkScores < ActiveRecord::Migration[7.1]
  def change
    create_table :utbk_scores do |t|
      t.string :no_peserta
      t.date :tanggal_ujian
      t.decimal :nilai_penalaran_umum
      t.decimal :nilai_pengetahuan_kuantitatif
      t.decimal :nilai_pengetahuan_dan_pemahaman_umum
      t.decimal :nilai_kemampuan_memahami_bacaan_dan_menulis
      t.decimal :jumlah_nilai_semester6
      t.integer :jumlah_pelajaran_semester6
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
