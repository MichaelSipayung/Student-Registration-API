class CreateLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :languages do |t|
      t.string :nama_bahasa
      t.string :tingkat
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
