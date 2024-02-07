class CreateMajors < ActiveRecord::Migration[7.1]
  def change
    create_table :majors do |t|
      t.string :jurusan1
      t.string :jurusan2
      t.string :jurusan3
      t.string :gelombang
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
