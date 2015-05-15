require 'pry'
class UrlsController < ApplicationController
  
  def new
    @url = Url.new
  end

  def create
    if Url.find_by(original_url: url_params[:original_url])
      @url = Url.find_by(original_url: url_params[:original_url])
      @url.save
      redirect_to @url
    else
      @url = Url.new(url_params)
      if @url.save && @url.valid?
        @url.update( :custom_url => @url.create_short_url)
        redirect_to @url
      else
        render :'new'
      end
    end
  end

  def show
    begin
      @url = Url.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @url = Url.find_by(custom_url: params[:id])
      redirect_to @url.original_url
    end
  end

  def update
    @url = Url.find(params[:id])
    @url.update(times_visited: @url.times_visited += 1)
    redirect_to @url.original_url
  end

  def top100
    @urls = Url.all.order(times_visited: :desc).first(100)
  end

  private

    def url_params
      params.require(:url).permit(:original_url)
    end
end
