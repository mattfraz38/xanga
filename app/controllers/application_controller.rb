class ApplicationController < ActionController::Base

  private

  def after_sign_in_path_for(resources)
    user_path(current_user)
  end

  def after_sign_out_path_for(resources)
    user_session_path
  end
end
