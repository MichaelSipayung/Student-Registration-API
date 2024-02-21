class UtbkFileUpload < ApplicationRecord
  belongs_to :user
  has_one_attached :sertifikat_utbk
  validates :sertifikat_utbk, attached: true, size: {less_than: 2.megabytes},
            content_type: %w[application/pdf image/png image/jpg image/jpeg]
end
