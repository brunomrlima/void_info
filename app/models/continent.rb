class Continent < ApplicationRecord
  include Filterable
  has_many :countries, dependent: :destroy
  has_many :data_covids, through: :countries
  scope :filter_by_name, -> (name) { where(name: name.titleize) }

  def to_h
    {"name": self.name}
  end

end
