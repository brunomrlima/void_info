class InfoMailer < ApplicationMailer
  include ActionView::Helpers::NumberHelper
  def daily_covid_email(email)
    set_covid_info
    mail(to: email.email, subject: "Covid-19 Info Today")
  end

  private
    def set_covid_info
      @array = []
      country_preferences = Country.where(name: ["USA", "Brazil", "Canada", "World"])
      country_preferences.each do |country|
        hash = {}
        data_covid = country.data_covids.last
        hash[:country] = country.name
        hash[:total_cases] = number_with_delimiter(data_covid.total_cases)
        hash[:new_cases] = number_with_delimiter(data_covid.new_cases)
        hash[:total_deaths] = number_with_delimiter(data_covid.total_deaths)
        hash[:new_deaths] = number_with_delimiter(data_covid.new_deaths)
        hash[:total_recovered] = number_with_delimiter(data_covid.total_recovered)
        hash[:active_cases] = number_with_delimiter(data_covid.active_cases)
        hash[:critical_cases] = number_with_delimiter(data_covid.critical_cases)
        @array << hash
      end

    end
end
