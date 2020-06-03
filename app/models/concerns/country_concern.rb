module CountryConcern
  extend ActiveSupport::Concern

  class_methods do
    def refactor_country_name(name)
      case name
      when "usa"
        "USA"
      when "uk"
        "UK"
      else
        name.titleize
      end
    end

    def refactor_dates(dates)
      return DateTime.now.beginning_of_day if dates == "today"
      return DateTime.yesterday if dates == "yesterday"
      date_times = []
      dates_array = dates.split(",")
      dates_array.each do |date|
        date_array = date.split("-").map(&:to_i)
        date_times << DateTime.new(date_array[0], date_array[1], date_array[2])
      end
      date_times.sort!
      date_times.first..date_times.last
    end
  end

end