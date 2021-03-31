class StaticPagesController < ApplicationController
  def home
    @current_user = current_user
    @client_details = @current_user.client_details
  end

  def about
  end

  def help
  end
end
