class SubscriptionSettingsController < ApplicationController
  def subscribe
    email = Rails.application.message_verifier(:subscribe).verify(params[:subscribe_id])
    email = Email.find(email)
    if email.update_attributes(subscription: true)
      InfoMailer.welcome_email(email).deliver_now
      flash[:notice] = "You're done! You subscribed for COVID-19 Info Emails."
    else
      flash[:alert] = "Something went wrong. Try to access the page again or send us an email."
    end
  end

  def unsubscribe
    @unsubscribe_id = params[:unsubscribe_id]
    email = Rails.application.message_verifier(:unsubscribe).verify(@unsubscribe_id)
    @email = Email.find(email)
    if @email.blank?
      flash[:alert] = "Something went wrong. Try to access the page again or send us an email."
      redirect_to root_path
    end
  end

  def update
    email = Rails.application.message_verifier(:unsubscribe).verify(params[:unsubscribe_id])
    email = Email.find(email)
    if email.blank?
      flash[:alert] = 'There was a problem'
      render :unsubscribe
    elsif email.update(email_params)
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
