namespace :send_info do

  desc "Send info to users"
  task :covid_info => :environment do
    emails = Email.all
    emails.find_each do |email|

    end

  end

end
