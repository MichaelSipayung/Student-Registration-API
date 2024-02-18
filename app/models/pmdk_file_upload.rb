class PmdkFileUpload < ApplicationRecord
  belongs_to :user
  has_one_attached :surat_rekomendasi
  has_one_attached :nilai_rapor
  has_one_attached :sertifikat
end
