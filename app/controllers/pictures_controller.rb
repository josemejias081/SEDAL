class PicturesController < ApplicationController
  def photo 
    @users = User.all
    @pagy, @users = pagy(User.all.order("created_at DESC"), items: 9) 
  end
end
