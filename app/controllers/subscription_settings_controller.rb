class SubscriptionSettingsController < ApplicationController
  def subscribe
    email = Rails.application.message_verifier(:subscribe).verify(params[:subscribe_id])
    email = Email.find(email)
    if email.update_attributes(subscription: true)
      InfoMailer.welcome_email(email)
      flash[:notice] = "You're done! You subscribed for COVID-19 Info Emails."
    else
      flash[:alert] = "Something went wrong. Try to access the page again or send us an email."
    end
  end

  def unsubscribe
    # email = Rails.application.message_verifier(:unsubscribe).verify(params[:id])
    # @email = Email.find(email)
    @email = Email.last
  end

  def update
    email = Rails.application.message_verifier(:unsubscribe).verify(params[:id])
    @email = Email.find(params[:id])
    if @user.update(email_params)
      flash[:notice] = 'Subscription Cancelled'
      redirect_to root_url
    else
      flash[:alert] = 'There was a problem'
      render :unsubscribe
    end
  end

  private
    def email_params
      params.require(:email).permit(:subscription)
    end
end
