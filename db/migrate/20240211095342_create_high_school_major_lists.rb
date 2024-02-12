class CreateHighSchoolMajorLists < ActiveRecord::Migration[7.1]
  def change
    create_table :high_school_major_lists do |t|
      t.string :jurusan

      t.timestamps
    end
  end
end
