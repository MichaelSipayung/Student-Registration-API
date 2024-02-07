class User < ApplicationRecord
  has_secure_password
  # mount_uploader :avatar, AvatarUploader
  validates :email, presence:true, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :username, presence: true, uniqueness: true
  validates :password, length: {minimum: 6},
            if: -> {:new_record? || !password.nil?}

  has_many :achievements
  has_many :addresses
  has_many :extras
  has_many :languages
  has_many :organizations

  has_one :major
  has_one :personal
  has_one :parent
  has_one :pmdk_each_score_information
  has_one :pmdk_school_information
  has_one :pmdk_total_score_information
  has_one :source
  has_one :usm_school_information
  has_one :utbk_school_information
  has_one :utbk_score

  def self.digest(string)
    # cost : the cost of hashing
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    # return the hash digest
    BCrypt::Password.create(string, cost:)
  end
end
