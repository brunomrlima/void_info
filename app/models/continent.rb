class Continent < ApplicationRecord
  include Filterable
  include ContinentConcern
  has_many :countries, dependent: :destroy
  has_many :data_covids, through: :countries
  scope :filter_by_name, -> (name) { where(name: refactor_continent_name(name)) }

  def to_h
    {"name": self.name}
  end

end
