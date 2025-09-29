module Api
  module V1
    class UrlsController < ActionController::API
      before_action :find_original_url, only: :create

      def create
        render json: { short_url: url_short_link(@url.short_code), original_url: @url.original_url }
      end

      def index
        urls = Url.all.map do |url|
          {
            original_url: url.original_url,
            short_code: url.short_code,
            short_url: url_short_link(url.short_code)
          }
        end
      
        render json: urls
      end

      private

      def url_short_link(short_code)
        "#{request.base_url}/#{short_code}"
      end 
      
      def find_original_url
        @url = Url.find_or_create_by(original_url:  params[:original_url])
      end
    end
  end
end
