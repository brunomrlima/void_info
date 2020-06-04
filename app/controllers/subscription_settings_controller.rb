class SubscriptionSettingsController < ApplicationController
  before_action :set_unsubscribe_verifier, except: :subscribe

  def subscribe
    subscribe_verifier = Rails.application.message_verifier(:subscribe)
    subscribe_id = params[:subscribe_id]
    if subscribe_verifier.valid_message?(subscribe_id)
      email_id = subscribe_verifier.verify(subscribe_id)
      email = Email.find_by_id(email_id)
      if email && email.update_attributes(subscription: true)
        InfoMailer.welcome_email(email).deliver_now
        flash[:notice] = "You're done! You subscribed for COVID-19 Info Emails."
      else
        flash[:alert] = "Something went wrong. Try to access the page again or send us an email at info@voidinfo.com"
      end
    else
      flash[:alert] = "Something went wrong. Try to access the page again or send us an email at info@voidinfo.com"
      redirect_to root_path
    end
  end

  def unsubscribe
    @unsubscribe_id = params[:unsubscribe_id]
    if @unsubscribe_verifier.valid_message?(@unsubscribe_id)
      email_id = @unsubscribe_verifier.verify(@unsubscribe_id)
      @email = Email.find_by_id(email_id)
    else
      flash[:alert] = "Something went wrong. Try to access the page again or send us an email at info@voidinfo.com"
      redirect_to root_path
    end
  end

  def update
    unsubscribe_id = params[:unsubscribe_id]
    if @unsubscribe_verifier.valid_message?(unsubscribe_id)
      email_id = @unsubscribe_verifier.verify(unsubscribe_id)
      email = Email.find_by_id(email_id)
      if email && email.update(email_params)
        flash[:notice] = 'Subscription Cancelled'
        redirect_to root_url
      else
        flash[:alert] = 'There was a problem. Please send us an email at info@voidinfo.com'
        render :unsubscribe
      end
    else
      flash[:alert] = "Something went wrong. Try to access the page again or send us an email at info@voidinfo.com"
      render root_path
    end
  end

  private
    def email_params
      params.require(:email).permit(:subscription)
    end

    def set_unsubscribe_verifier
      @unsubscribe_verifier = Rails.application.message_verifier(:unsubscribe)
    end
end
