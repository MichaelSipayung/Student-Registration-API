class User < ApplicationRecord
  attr_accessor :activation_token, :reset_token # create a virtual attribute
  before_create :create_activation_digest # call the method before creating a new user
  has_secure_password
  # mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, length: {minimum: 4, maximum: 25}
  validates :email, presence:true, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :username, presence: true, uniqueness: true, length: {minimum: 6}
  validates :password, length: {minimum: 6},
            if: -> {:new_record? || !password.nil?}

  has_many :achievements, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :extras, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :organizations, dependent: :destroy

  has_one :major, dependent: :destroy
  has_one :personal, dependent: :destroy
  has_one :parent, dependent: :destroy
  has_one :pmdk_each_score_information, dependent: :destroy
  has_one :pmdk_school_information, dependent: :destroy
  has_one :pmdk_total_score_information, dependent: :destroy
  has_one :source, dependent: :destroy
  has_one :usm_school_information, dependent: :destroy
  has_one :utbk_school_information, dependent: :destroy
  has_one :utbk_score, dependent: :destroy
  has_one :pmdk_file_upload, dependent: :destroy
  has_one :utbk_file_upload, dependent: :destroy

  def self.digest(string)
    # cost : the cost of hashing
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    # return the hash digest
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token(type=:string)
    if type == :string
      SecureRandom.urlsafe_base64 # create a random token
    else
      SecureRandom.random_number(900_000)+100_000 # create a random number token
    end
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def clear_reset_digest
    update_attribute(:reset_digest, nil)
    update_attribute(:reset_sent_at, nil)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest") # get the digest
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token) # compare the token with the digest
  end

  def create_reset_digest
    self.reset_token = User.new_token(1)
    update_attribute(:reset_digest, User.digest(reset_token)) # create a new digest
    update_attribute(:reset_sent_at, Time.zone.now) # set the reset sent time
  end

  def send_password_reset_email # send the email with the reset token
    UserMailer.password_reset(self).deliver_now
  end

  private

  def create_activation_digest
    self.activation_token = User.new_token # create a new token
    self.activation_digest = User.digest(activation_token) # create a new digest
  end
end
