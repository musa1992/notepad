class SessionsController < ApplicationController
  def new
  end

  def create
    officer = RelationshipOfficer.find_by(email: params[:session][:email].downcase)
    if officer && officer.authenticate(params[:session][:password])
      if officer.activated?
        log_in officer
        redirect_to home_path
      else
        message = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to signup_path
      end
    else
      flash.now[:danger] = "Invalid email/ Password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
