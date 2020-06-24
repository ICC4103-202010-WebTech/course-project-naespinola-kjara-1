class ApplicationController < ActionController::Base

    def current_person
      if current_user
        current_user
      elsif current_admin
        current_admin
      else
        User.new
      end
    end



end
