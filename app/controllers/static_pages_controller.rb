class StaticPagesController < ApplicationController

  def home
    if logged_in?
      current_user
    end
  end

  def about

  end

end
