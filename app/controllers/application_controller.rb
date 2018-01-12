class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :require_login

    # Authenticate a user with by token
    def authorize_request
        authenticate_with_http_token do |token, options|
            User.find_by(token: token)
        end
    end

    def render_unauthorized(message)
        errors = {errors: [{details: message}]}
        render json: errors, status: :unauthorized
    end

    # used/called when we need authentication
    def require_login
        authorize_request || render_unauthorized("Access denied")
    end

    # Helper method to find the current_user in a request
    def current_user
        @current_user ||= authorize_request
    end

end
