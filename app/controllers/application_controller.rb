class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/login', :notice => exception.message
  end
end
