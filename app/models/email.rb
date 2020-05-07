class Email < ApplicationRecord
  def is_new_email?
    return Email.find_by(email: self.email).blank?
  end
end
