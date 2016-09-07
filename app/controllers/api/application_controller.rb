module API
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :null_session
    include Authenticable

    before_action :authenticate_with_token!



    # def authenticate_user
    #   authenticate_with_http_token do |token|
    #     @current_user = User.find_by(api_key: token)
    #     if @current_user.nil?
    #       render json: { error: "Unauthorized" }, status: 401
    #       return
    #     end
    #   end
    # end
  end
end
