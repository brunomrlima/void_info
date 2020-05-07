class Country < ApplicationRecord
  belongs_to :continent
  has_many :data_covids, dependent: :destroy
end
