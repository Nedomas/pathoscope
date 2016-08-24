class SessionsController < Devise::SessionsController
  respond_to :json
  def create
    binding.pry
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
      :json => { :success => true,
                 :info => "Logged in",
                 :user => current_user
    }
  end

  def destroy
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_out
    render :status => 200,
      :json => { :success => true,
                 :info => "Logged out",
    }
  end

  def failure
    render :status => 401,
      :json => { :success => false,
                 :info => "Login Credentials Failed"
    }
  end

  def show_current_user
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    render :status => 200,
      :json => { :success => true,
                 :info => "Current User",
                 :user => current_user
    }

  end
end
  # def create
  #   binding.pry
  #   resource = warden.authenticate!(scope: resource_name, recall: "sessions#failure")
  #   sign_in_and_redirect(resource_name, resource)
  # end

  # def sign_in_and_redirect(resource_or_scope, resource=nil)
  #   scope = Devise::Mapping.find_scope!(resource_or_scope)
  #   resource ||= resource_or_scope
  #   sign_in(scope, resource) unless warden.user(scope) == resource
  #   return render :json => {:success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
  # end

  # def failure
  #   render :json => {:success => false, :errors => ["Login failed."]}
  # end
