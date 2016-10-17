require "archangel/application_responder"

module Archangel
  class ApiController < ActionController::API
    respond_to :json

    rescue_from ActionController::UnknownController,
                AbstractController::ActionNotFound,
                ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActionController::ParameterMissing, with: :error_during_processing
    rescue_from ActiveRecord::RecordInvalid, with: :error_during_processing

    before_action :set_content_type
    before_action :current_api_site
    before_action :current_api_user
    before_action :verify_authenticity_token

    protected

    def current_api_site
      @current_api_site ||= Archangel::Site.current
    end

    def current_api_user
      @current_api_user ||= find_api_user
    end

    def per_page
      params[:limit] || Kaminari.config.default_per_page
    end

    def api_key
      request.headers["X-Archangel-Token"] || params[:token]
    end

    def requires_authentication?
      true
    end

    private

    def set_content_type
      headers["Content-Type"] = "application/json; charset=utf-8"
    end

    def find_api_user
      user = Archangel::User.find_by(api_token: api_key.to_s)

      unless user.present?
        render "archangel/api/errors/unknown_api_key", status: 401 and return
      end

      user
    end

    def verify_authenticity_token
      return if @current_api_user

      if requires_authentication? && api_key.blank?
        render "archangel/api/errors/missing_api_key", status: 401 and return
      else
        @current_api_user = Archangel::User.new
      end
    end

    def not_found
      render "archangel/api/errors/not_found", status: 404 and return
    end

    def error_during_processing
      render "archangel/api/errors/unprocessable_entity", status: 422 and return
    end
  end
end
