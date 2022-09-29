class User < ApplicationRecord
  # validates :fname, presence: true
  has_secure_password
  validates :fname, presence: true
  validates :lname, presence: true 
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
