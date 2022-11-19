class User < ApplicationRecord
  has_secure_password validations: !:skip_password_validation
  validates :role_id, numericality: { message: "Should be a number" }
  validates :fname, presence: { message: "Cannot be blank" }
  validates :lname, presence: { message: "Cannot be blank" }
  validates :email, presence: { message: "Cannot be blank" },
                    uniqueness: { message: "Email is already taken" },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, unless: :skip_password_validation,
                       length: { minimum: 6, message: "Minimum of 6 characters" },
                       if: -> { new_record? || !password.nil? }
  validates :age, numericality: { message: "Should be a number" },
                  if: -> { !age.nil? }
  validates :address, presence: { message: "Cannot be blank" }

  attr_accessor :skip_email_validation
  attr_accessor :skip_password_validation

  private

  def custom_message_presence
    custom_message_presence = { message: "Cannot be blank" }
  end
end
