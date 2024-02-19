class CreateUtbkFileUploads < ActiveRecord::Migration[7.1]
  def change
    create_table :utbk_file_uploads do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
