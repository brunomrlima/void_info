namespace :reminder do

  desc "Remind users that didn't authenticated their email"
  task :email_authentication => :environment do
    emails = Email.not_subscribed
    emails.find_each do |email|
      InfoMailer.authentication_email(email).deliver_now
    end
  end

end
