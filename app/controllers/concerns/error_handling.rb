# frozen_string_literal: true

module ErrorHandling
  extend ActiveSupport::Concern

  ERROR_CODES = {
    400 => "BAD_REQUEST",
    401 => "UNAUTHORIZED",
    403 => "FORBIDDEN",
    404 => "NOT_FOUND",
    422 => "VALIDATION_ERROR",
    500 => "INTERNAL_ERROR"
  }.freeze

  MODEL_TRANSLATIONS = {
    "Standard" => "Framework",
    "BusinessProcess" => "Application"
  }

  included do
    rescue_from StandardError, with: :handle_standard_error
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :handle_validation_error
    rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing
    rescue_from ActionDispatch::Http::Parameters::ParseError, with: :handle_parse_error
    rescue_from ActionController::BadRequest, with: :handle_bad_request
  end

  private

  def safe_params
    params.respond_to?(:to_unsafe_h) ? params.to_unsafe_h : {}
  rescue
    {}
  end

  def handle_standard_error(exception)
    error_message = Rails.env.development? ? exception.message : "An unexpected error occurred"

  end

  def handle_not_found(exception)

    model_name = exception.try(:model) || "Resource"
    model_name = MODEL_TRANSLATIONS.fetch(model_name, model_name)

    render_error(
      "#{model_name} not found",
      status: :not_found,
      code: ERROR_CODES[404]
    )
  end

  def handle_validation_error(exception)
    errors = exception.record.errors.full_messages.join(", ")

    render_error(
      errors,
      status: :unprocessable_entity,
      code: ERROR_CODES[422]
    )
  end

  def handle_parameter_missing(exception)

    render_error(
      "Missing required parameter: #{exception.param}",
      status: :bad_request,
      code: ERROR_CODES[400]
    )
  end

  def handle_unauthorized(exception)

    render_error(
      "You are not authorized to perform this action",
      status: :forbidden,
      code: ERROR_CODES[403]
    )
  end

  def handle_parse_error(exception)
    
    render_error(
      "Invalid JSON payload",
      status: :bad_request,
      code: ERROR_CODES[400]
    )
  end

  def handle_bad_request(exception)

    render_error(
      exception.message.to_s,
      status: :bad_request,
      code: ERROR_CODES[400]
    )
  end
end
