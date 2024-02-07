class ChangeNiktoBigIntInPersonals < ActiveRecord::Migration[7.1]
  def change
    change_column :personals, :nik, :bigint
    change_column :personals, :nisn, :bigint
    change_column :personals, :no_kps, :bigint
  end
end
