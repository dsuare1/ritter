class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def greetings
    render html: "greetings, pangea"
  end
end
