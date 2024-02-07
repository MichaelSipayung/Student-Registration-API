class ChangeUsmSchoolInformation < ActiveRecord::Migration[7.1]
  def change
    change_column :usm_school_informations,
                  :jumlah_nilai_semester5, :decimal
    change_column :usm_school_informations,
                  :jumlah_pelajaran_semester5, :integer
  end
end
