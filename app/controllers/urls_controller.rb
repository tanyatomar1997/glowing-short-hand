class UrlsController < ApplicationController
  def new
    @short_url = Url.new
  end

  def create
    @short_url = Url.find_by(original_url: short_url_params[:original_url])

    unless @short_url
      @short_url = Url.new(original_url: short_url_params[:original_url])
      return render :new, status: :unprocessable_entity unless @short_url.save
    end

    redirect_to action: :show, id: @short_url.id
  end

  def show
    @short_url = Url.find_by(id: params[:id]) || Url.find_by(short_code: params[:id])
    @shortened_full = @short_url ? "#{request.base_url}/#{@short_url.short_code}" : ""
  end

  private

  def short_url_params
    params.require(:url).permit(:original_url)
  end
end
