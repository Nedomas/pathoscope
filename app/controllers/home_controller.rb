class HomeController < ApplicationController
  # include Devise::Controllers::Helpers

  def index
  end

  def sign_out
    render json: true
  end
end
