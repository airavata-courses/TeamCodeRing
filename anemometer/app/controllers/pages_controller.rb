require 'net/http'
class PagesController < ApplicationController
  def index
    @station_list = YAML.load(File.read("config/station.yml"))
  end

  def form_url
    params[:stations]
    params[:start][:date]
    uri = URI('http://127.0.0.1:5000/')
    params = { :limit => 10, :page => 3 }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
    redirect_to root_path, notice: "Redirected to flask app"

  end

end