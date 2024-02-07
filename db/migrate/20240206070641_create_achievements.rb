class CreateAchievements < ActiveRecord::Migration[7.1]
  def change
    create_table :achievements do |t|
      t.string :nama_prestasi
      t.date :tahun
      t.string :tingkat
      t.string :kategori
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
