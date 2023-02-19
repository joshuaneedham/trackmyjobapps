class ApplicationController < ActionController::Base
  config.time_zone = "Eastern Time (US & Canada)"
  before_action :set_time_zone, if: :user_signed_in?

  def after_sign_in_path_for(_resource)
    dashboard_path
  end

  private

  def set_time_zone
    Time.zone = current_user.time_zone
  end
end
