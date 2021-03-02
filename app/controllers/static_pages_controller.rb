class StaticPagesController < ApplicationController
  def home
    @current_user = current_user
  end

  def about
  end

  def help
  end
end
