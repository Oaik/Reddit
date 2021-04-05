class HomepageController < ApplicationController

  # GET /
  def index
    if user_signed_in?
      # redirect_to "/posts"
      @posts = Post.all
      @channels = Channel.all
    else
      redirect_to "/users/sign_in"
    end
  end
end
