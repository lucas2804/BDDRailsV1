class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!
  rescue_from Pundit::NotAuthorizedError, with: :pundit_not_authorized
  def index
  end

  private
  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, alert: "You must be an admin to do that."
    end
  end

  def pundit_not_authorized
    redirect_to root_path, alert: "Your aren't allowed to do that. (Pundit)"
  end

end
