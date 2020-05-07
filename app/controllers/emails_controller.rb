class EmailsController < ApplicationController
  def index
    @email = Email.new
  end

  def create
    email = Email.new(emails_params)
    if email.is_new_email?
      if email.save!
        flash[:notice] = "You successfully subscribed!"
      else
        flash[:danger] = "Something went wrong... Try again."
      end
    else
      flash[:danger] = "This email is already subscribed."
    end
    redirect_to root_path
  end

  private
    def emails_params
      params.require(:email).permit(:email)
    end
end
