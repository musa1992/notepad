class RelationshipOfficersController < ApplicationController
  def new
    @ro = RelationshipOfficer.new
  end

  def show
  end

  def create
    @ro = RelationshipOfficer.new(ro_params)
    if @ro.save
      log_in @ro
      flash[:success] = "Welcome!"
      redirect_to @ro
    else
      render 'new'
    end
  end

  private
    def ro_params
      params.require(:relationship_officer).permit(:name, :email, :password, :password_confirmation)
    end
end
