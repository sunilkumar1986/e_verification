class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

# rescue_from Site::UndefinedError do |e|
#  redirect_to new_site_path
# end

 unless Rails.application.config.consider_all_requests_local
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActionController::UnknownController, with: :render_404
  rescue_from ActionController::UnknownAction, with: :render_404
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
 end

  #def after_sign_up_path_for(resource)
  #  new_profiles_path
  #end

  def after_sign_in_path_for(resource)
    current_user.attendences.create!(login_time: Time.now.strftime("at %H:%M%p"), login_date: Date.today )
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    user = Attendence.find_by_user_id(current_user.id)
    user.update_attributes(logout_time: Time.now.strftime("at %H:%M%p")) if user
    root_path
  end

private

 def render_404(exception)
  @not_found_path = exception.message
    respond_to do |format|
      format.html { render template: 'errors/error_404', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
 end



end
