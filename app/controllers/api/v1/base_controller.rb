# frozen_string_literal: true

module Api
  module V1
    class BaseController < ActionController::Base
      include ApiKeyAuthenticatable
      include ErrorHandling

      skip_before_action :verify_authenticity_token
      before_action :authenticate_api_key!
    end
  end
end
