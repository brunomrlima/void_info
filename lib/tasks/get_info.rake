namespace :get_info do

  desc "Gets info from worldometers"
  task :from_worldometers => :environment do
    puts "Conecting to wordometers"
    doc = Nokogiri::HTML(open("https://www.worldometers.info/coronavirus/"))
    table = doc.at_css('[id="main_table_countries_today"]')
    rows = table.css('tr')
    column_names = rows.css('th').map(&:text)

    text_all_rows = rows.map do |row|
      row_values = row.css('td').map(&:text)
      [*row_values]
    end

    text_all_rows.each do |row_as_text|
      p column_names.zip(row_as_text).to_h
    end

  end

end
