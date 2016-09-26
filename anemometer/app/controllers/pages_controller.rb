require 'net/http'
class PagesController < ApplicationController
  def index
    @station_list = YAML.load(File.read("config/station.yml"))
  end

  def form_url
    uri = URI(RAIN_GAUGE[Rails.env])
    uri.query = URI.encode_www_form(:stations => params[:stations], :date => params[:start][:date])
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      flash[:success] = "Data ingested, The data URL is : #{res.body}"
    else
      flash[:failure] = "Unable to get a Data URL"
    end
    redirect_to root_path
  end

end