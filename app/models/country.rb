class Country < ApplicationRecord
  include Filterable
  belongs_to :continent
  has_many :data_covids, dependent: :destroy
  has_many :preferences, dependent: :destroy
  scope :filter_by_name, -> (name) { where(name: name.titleize) }

  def to_h
    {"name": self.name}
  end

end
