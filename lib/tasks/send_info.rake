namespace :send_info do

  desc "Send info to users"
  task :covid_info => :environment do
    emails = Email.subscribed
    emails.find_each do |email|
      InfoMailer.daily_covid_email(email).deliver_now
    end
  end

  desc "Send info to me"
  task :covid_info_to_me => :environment do
    email = Email.where(email: "bruno.mrlima@gmail.com").last
    InfoMailer.daily_covid_email(email).deliver_now
  end

end
