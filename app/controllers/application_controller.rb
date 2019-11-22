class ApplicationController < ActionController::Base
  def authenticate
    if session[:user_id].nil?
      redirect_to login_url
    end
  end
end
