class Email < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email" }

  def is_new_email?
    return Email.find_by(email: self.email).blank?
  end

  def is_a_valid_email?
    (self.email =~ URI::MailTo::EMAIL_REGEXP)
  end
end
