class Api::V1::BaseController < ApplicationController
  include SecuredRequest
  
  protect_from_forgery with: :null_session

  def not_found
    # render json: { error: 'not_found' }
    render "/not_found"
  end

  private

  def authorize_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def current_user
    return unless request.headers.include? "Authorization"

    @current_user ||= User.where(id: session[:user_id]).first
  end

  helper_method :current_user
end
