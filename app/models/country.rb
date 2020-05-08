class Country < ApplicationRecord
  belongs_to :continent
  has_many :data_covids, dependent: :destroy
  has_many :preferences, dependent: :destroy
end
