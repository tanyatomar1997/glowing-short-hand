# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # Where Swagger JSON files will be generated
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define Swagger documents and global metadata
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'Short URL API',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: '/',
          description: 'Local server'
        }
      ]
    }
  }

  # Format of output (yaml)
  config.swagger_format = :yaml
end
