class Email < ApplicationRecord
  has_many :preferences
  accepts_nested_attributes_for :preferences
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email" }
  scope :subscribed, -> { where(subscription: true) }

  def is_new_email?
    return Email.find_by(email: self.email).blank?
  end
end
