require 'rails_helper'

RSpec.describe "ShortUrls", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/short_urls/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/short_urls/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/short_urls/show"
      expect(response).to have_http_status(:success)
    end
  end

end
