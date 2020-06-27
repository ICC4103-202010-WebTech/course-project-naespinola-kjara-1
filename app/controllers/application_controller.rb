class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if:
      :devise_controller?

    def current_person
      if current_user
        current_user
      elsif current_admin
        current_admin
      else
        User.new
      end
    end

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :terms_of_service ])

    end


end
