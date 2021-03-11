class RelationshipOfficersController < ApplicationController
  def new
    @ro = RelationshipOfficer.new
  end

  def show
  end

  def create
    @ro = RelationshipOfficer.new(ro_params)
    if @ro.save
      @ro.send_activation_link
      flash[:info] = "Please check your email to activate your account"
      
      redirect_to signup_path
    else
      render 'new'
    end
  end

  private
    def ro_params
      params.require(:relationship_officer).permit(:name, :email, :password, :password_confirmation)
    end
end
