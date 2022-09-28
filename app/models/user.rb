class User < ApplicationRecord
  # validates :fname, presence: true
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password_digest,
            length: { minimum: 6 },
            if: -> { new_record? || !password_digest.nil? }
end
