# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username full_name email password image isPrivate])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password current_password image isPrivate])
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end

  def record_not_found
    flash[:alert] = 'Record not found'
    redirect_back(fallback_location: root_path)
  end

  def record_invalid(error)
    flash[:alert] = error.message
    redirect_back(fallback_location: root_path)
  end
end
