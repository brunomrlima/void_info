namespace :get_info do

  desc "Gets info from worldometers"
  task :from_worldometers => :environment do
    puts "Conecting to wordometers"
    doc = Nokogiri::HTML(URI.open("https://www.worldometers.info/coronavirus/"))
    table = doc.at_css('[id="main_table_countries_today"]')
    rows = table.css('tr')
    column_names = rows.css('th').map(&:text)

    text_all_rows = rows.map do |row|
      row_values = row.css('td').map(&:text)
      [*row_values]
    end

    text_all_rows.each do |row_as_text|
      hash = column_names.zip(row_as_text).to_h
      next if hash["Continent"].blank? || hash["Country,Other"].blank?

      continent_name = hash["Continent"].gsub("\n", "")
      continent = Continent.find_or_create_by(name: continent_name)

      country_name = hash["Country,Other"].gsub("\n", "")
      country_name.eql?("Total:") ? country_name += continent_name : country_name
      country = Country.find_or_create_by(name: country_name, continent: continent)

      time_now = DateTime.now
      date = DateTime.new(time_now.year, time_now.month, time_now.day)

      puts "Recording #{country_name}"

      data_covid = DataCovid.find_or_create_by(country: country, data_date: date)
      data_covid.total_cases = hash["TotalCases"].gsub(",","").to_i
      data_covid.new_cases = hash["NewCases"].gsub(",","").to_i
      data_covid.total_deaths = hash["TotalDeaths"].gsub(",","").to_i
      data_covid.new_deaths = hash["NewDeaths"].gsub(",","").to_i
      data_covid.total_recovered = hash["TotalRecovered"].gsub(",","").to_i
      data_covid.active_cases = hash["ActiveCases"].gsub(",","").to_i
      data_covid.critical_cases = hash["Serious,Critical"].gsub(",","").to_i
      data_covid.total_cases_per_million = hash["Tot Cases/1M pop"].gsub(",","").to_i
      data_covid.deaths_per_million = hash["Deaths/1M pop"].gsub(",","").to_i
      data_covid.total_tests = hash["TotalTests"].gsub(",","").to_i
      data_covid.tests_per_million = hash["Tests/\n1M pop\n"].gsub(",","").to_i
      data_covid.save!

    end

  end

end
