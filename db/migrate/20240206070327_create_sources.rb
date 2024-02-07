class CreateSources < ActiveRecord::Migration[7.1]
  def change
    create_table :sources do |t|
      t.integer :jumlah_n
      t.string :sumber_informasi
      t.string :motivasi
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
