class EmailsController < ApplicationController
  def index
    @email = Email.new
    @countries = Country.all.order(name: :asc)
    3.times{@email.preferences.new}
  end

  def create
    email = Email.new(emails_params)
    if email.is_new_email?
      if email.save
        InfoMailer.authentication_email(email).deliver_now
        flash[:notice] = "You are almost there! We need to verify your email. Check your email inbox. Don't forget to check your spam folder."
      else
        flash[:alert] = "Something went wrong... Try again. Make sure to select all the regions that you prefer."
      end
    else
      email = Email.find_by(email: email.email)
      if email.is_subscribed?
        flash[:alert] = "This email is already subscribed."
      else
        InfoMailer.authentication_email(email).deliver_now
        flash[:notice] = "You are almost there! We need to verify your email. Check your email inbox. Don't forget to check your spam folder."
      end
    end
    redirect_to root_path
  end

  private
    def emails_params
      params.require(:email).permit(:email, preferences_attributes:[:country_id])
    end
end
