class PmdkFileUpload < ApplicationRecord
  belongs_to :user
  has_one_attached :surat_rekomendasi
  has_one_attached :nilai_rapor
  has_one_attached :sertifikat
  validates :surat_rekomendasi, :nilai_rapor, :sertifikat, attached: true,
    content_type: %w[application/pdf image/png image/jpg image/jpeg], size: {less_than: 2.megabytes}
end
