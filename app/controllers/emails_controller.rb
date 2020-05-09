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
        InfoMailer.welcome_email(email).deliver_now
        flash[:notice] = "You successfully subscribed!"
      else
        flash[:alert] = "Something went wrong... Try again. Make sure to select all the regions that you prefer."
      end
    else
      flash[:alert] = "This email is already subscribed."
    end
    redirect_to root_path
  end

  private
    def emails_params
      params.require(:email).permit(:email, preferences_attributes:[:country_id])
    end
end
