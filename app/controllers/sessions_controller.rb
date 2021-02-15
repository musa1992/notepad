class SessionsController < ApplicationController
  def new
  end

  def create
    officer = RelationshipOfficer.find_by(email: params[:session][:email].downcase)
    if officer && officer.authenticate(params[:session][:password])
      log_in officer
      redirect_to officer
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
