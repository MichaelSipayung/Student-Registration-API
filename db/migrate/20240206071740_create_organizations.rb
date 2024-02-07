class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations do |t|
      t.string :nama_organisasi
      t.date :mulai
      t.date :berakhir
      t.string :jabatan
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
