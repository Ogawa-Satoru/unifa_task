class User < ApplicationRecord
  before_create :create_remember_token

  # 8桁以上 && 大小英数字および記号を含む
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[\W_])[!-~]{8,}+\z/

  validates :user_id, presence: true, uniqueness: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :password_confirmation, presence: true, on: :create

  has_secure_password

  class << self
    def new_remember_token
      SecureRandom.urlsafe_base64
    end

    def encrypt(token)
      Digest::SHA256.hexdigest(token.to_s)
    end
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
