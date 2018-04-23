class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # confirms a logged-in user
  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = 'Please log in first.'
        redirect_to login_url
      end
    end
end
