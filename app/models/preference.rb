class Preference < ApplicationRecord
  belongs_to :email
  belongs_to :country
end
