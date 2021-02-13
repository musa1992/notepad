class RelationshipOfficersController < ApplicationController
  def new
    @ro = RelationshipOfficer.new
  end

  def show
    @ro = RelationshipOfficer.find(params[:id])
  end
end
