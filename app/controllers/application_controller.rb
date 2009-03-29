# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'f91a18d512aa0229adea21d0c61f7b38'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def admin
    authorization(10)
  end
  def user
    authorization(1)
  end
  
  def authorization(level)
    if self.current_user and self.current_user.access_level >= level
      return true
    else
      flash[:notice] = "You do not have access to this page."
      redirect_to new_session_path
      return false
    end
  end
  
end
