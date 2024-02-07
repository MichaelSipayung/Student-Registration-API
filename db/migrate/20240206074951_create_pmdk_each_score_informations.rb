class CreatePmdkEachScoreInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :pmdk_each_score_informations do |t|
      t.decimal :matematika1
      t.decimal :matematika2
      t.decimal :matematika3
      t.decimal :matematika4
      t.decimal :matematika5
      t.decimal :fisika1
      t.decimal :fisika2
      t.decimal :fisika3
      t.decimal :fisika4
      t.decimal :fisika5
      t.decimal :kimia1
      t.decimal :kimia2
      t.decimal :kimia3
      t.decimal :kimia4
      t.decimal :kimia5
      t.decimal :inggris1
      t.decimal :inggris2
      t.decimal :inggris3
      t.decimal :inggris4
      t.decimal :inggris5
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
