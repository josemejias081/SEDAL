class HomeController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :authenticate_user!, only: [:home]
  def welcome
  end

  def admi
  end
end