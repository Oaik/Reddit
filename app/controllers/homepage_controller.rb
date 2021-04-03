class HomepageController < ApplicationController

  # GET /
  def index
    if user_signed_in?
      redirect_to "/posts"
    end
  end
end
