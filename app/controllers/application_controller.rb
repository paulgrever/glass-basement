class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include RegionsHelper
  include SessionsHelper
  include CompaniesHelper

  def types_of_interview
    ["phone", "in-person", "technical", "video", "other"]
  end
end
