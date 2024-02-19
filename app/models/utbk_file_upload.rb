class UtbkFileUpload < ApplicationRecord
  belongs_to :user
  has_one_attached :sertifikat_utbk
end
