class SessionsController < ApplicationController
  def new
  end

  def create
    officer = RelationshipOfficer.find_by(email: params[:email].downcase)
    if officer && officer.authenticate(params[:password])
      #go to user profile
    else
      flash.now[:danger] = "Invalid email/ Password"
      render 'new'
    end
  end

  def destroy

  end
end
