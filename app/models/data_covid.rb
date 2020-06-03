class DataCovid < ApplicationRecord
  include Filterable
  include CountryConcern
  include ContinentConcern
  belongs_to :country
  scope :filter_by_country, -> (country_name) { joins(:country).where(countries: {name: refactor_country_name(country_name)}) }
  scope :filter_by_continent, -> (continent_name) { joins(country: :continent).where(continents: {name: refactor_continent_name(continent_name)}) }
  scope :filter_by_dates, -> (dates) { where(data_date: refactor_dates(dates)) }

  def to_h
    {
        "date": self.data_date,
        "country": self.country.name,
        "total_cases": self.total_cases,
        "new_cases": self.new_cases,
        "total_deaths": self.total_deaths,
        "new_deaths": self.new_deaths,
        "total_recovered": self.total_recovered,
        "active_cases": self.active_cases,
        "critical_cases": self.critical_cases,
        "total_cases_per_million": self.total_cases_per_million,
        "deaths_per_million": self.deaths_per_million,
        "total_tests": self.total_tests,
        "tests_per_million": self.tests_per_million
    }
  end

end
