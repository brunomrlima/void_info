class Preference < ApplicationRecord
  belongs_to :email
  belongs_to :country
  validates :country_id, presence: true
end
