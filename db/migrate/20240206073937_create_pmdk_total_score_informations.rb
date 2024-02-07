class CreatePmdkTotalScoreInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :pmdk_total_score_informations do |t|
      t.decimal :jumlah_nilai_semester1
      t.decimal :jumlah_nilai_semester2
      t.decimal :jumlah_nilai_semester3
      t.decimal :jumlah_nilai_semester4
      t.decimal :jumlah_nilai_semester5
      t.integer :jumlah_pelajaran_semester1
      t.integer :jumlah_pelajaran_semester2
      t.integer :jumlah_pelajaran_semester3
      t.integer :jumlah_pelajaran_semester4
      t.integer :jumlah_pelajaran_semester5
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
