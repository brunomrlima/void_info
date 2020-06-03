class Email < ApplicationRecord
  has_many :preferences, dependent: :destroy
  accepts_nested_attributes_for :preferences
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email" }, presence: true
  scope :subscribed, -> { where(subscription: true) }
  scope :not_subscribed, -> { where(subscription: false) }

  def is_new_email?
    Email.find_by(email: self.email).blank?
  end

  def is_subscribed?
    self.subscription
  end

end
