require 'net/http'
require 'json'

class PagesController < ApplicationController
  def index
    @station_list = YAML.load(File.read("config/station.yml"))
  end

  def form_url
    uri = URI(RAIN_GAUGE[Rails.env])
    uri.query = URI.encode_www_form(:stations => params[:stations], :date => params[:start][:date])
    @data_results = Net::HTTP.get_response(uri)
    if @data_results.is_a?(Net::HTTPSuccess)
      flash[:success] = "Data ingestor invoked, here are the results..."
    else
      flash[:failure] = "Unable to get a Data URL"
      redirect_to root_path
    end
  end

end