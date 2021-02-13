class RelationshipOfficersController < ApplicationController
  def new
    @ro = RelationshipOfficer.new
  end

  def show
    @ro = RelationshipOfficer.find(params[:id])
  end

  def create
    @ro = RelationshipOfficer.new(ro_params)
    if @ro.save
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
