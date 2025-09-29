# frozen_string_literal: true

module ApiKeyAuthenticatable
  extend ActiveSupport::Concern

  private

  def authenticate_api_key!
    return render_error("Missing API credentials", status: :unauthorized, code: "MISSING_CREDENTIALS") if secret.blank?

    render_error("Invalid API credentials", status: :unauthorized, code: "INVALID_CREDENTIALS") unless api_key
  end

  def secret
    @secret ||= request.headers["Authorization"]&.split(" ")&.last
  end

  def api_key
    byebug
    if secret == "valid_token"
      true
    else
      false
    end
  end
end
