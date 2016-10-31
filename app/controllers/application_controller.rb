class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  
  def after_sign_in_path_for(resource)
    # Change redirect after sign in
    user_path(resource.id)
    # resource = the current user
    puts "RESOURCE:"
    puts resource
  end
end
