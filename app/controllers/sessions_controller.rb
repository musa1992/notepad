class SessionsController < ApplicationController
  def new
  end

  def create
    officer = RelationshipOfficer.find_by(email: params[:email].downcase)
    if officer && officer.authenticate(params[:password])
      log_in officer
      redirect_to officer
    else
      flash.now[:danger] = "Invalid email/ Password"
      render 'new'
    end
  end

  def destroy
    redirect_to login_path
  end
end
