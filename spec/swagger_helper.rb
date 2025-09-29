# frozen_string_literal: true

require 'rails_helper'
require "rswag/specs"

RSpec.configure do |config|
  config.openapi_root = Rails.root.join("swagger").to_s
  config.openapi_specs = {
    "v1/swagger.yaml" => {
      openapi: "3.0.1",
      info: {
        title: "API V1",
        version: "v1"
      },
      components: {
        securitySchemes: {
          BearerAuth: {
            type: :http,
            scheme: :bearer,
            bearerFormat: "Opaque"
          }
        }
      },
      security: [{BearerAuth: []}],
      paths: {},
      servers: [
        {url: "/", description: "Server"}
      ]
    }
  }

  config.openapi_format = :yaml
end