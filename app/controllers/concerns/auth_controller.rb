class ApplicationController < ActionController::API
  before_action :authenticate_user!

  private

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    unless token && token == "mysecrettoken"
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
