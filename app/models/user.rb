class User < ApplicationRecord
  has_secure_password validations: !:skip_password_validation
  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, unless: :skip_password_validation,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
  validates :age, numericality: {only_interger: true},
            if: -> { !age.nil? }
  attr_accessor :skip_password_validation
end
