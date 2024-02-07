class PmdkSchoolInformation < ApplicationRecord
  belongs_to :user
  validates :jurusan_sekolah, presence: true, length: { minimum: 3, maximum: 50 }
  validates :asal_sekolah, presence: true, length: { minimum: 3, maximum: 50 }
  validates :akreditas, presence: true, length: { minimum: 1, maximum: 20 }
  validates :jumlah_nilai_un, presence: false, numericality: {
    greater_than_or_equal_to: 2, less_than_or_equal_to: 1000
  }, allow_nil: true
  validates :jumlah_pelajaran_un, presence: false, numericality: {
    only_integer: true, greater_than_or_equal_to: 2,
    less_than_or_equal_to: 10
  }, allow_nil: true
  # has_one_attached :nilai_rapor
  # validates :nilai_rapor, content_type: [:pdf], size: { less_than: 1.megabytes }
end
