require 'net/http'
require 'json'
require 'redis'
class PagesController < ApplicationController

  before_filter :require_current_user

  def index
    @station_list = YAML.load(File.read("config/station.yml"))
  end

  def form_url
    @current_request_key = "request:"+current_user.id.to_s+":"+Time.new.utc.to_s
    add_redis_keys
    @data_results = call_data_ingestor
    if @data_results.is_a?(Net::HTTPSuccess)
      flash[:success] = "Data ingested successfully!!"
    else
      flash[:failure] = "Unable to get a Data URL"
      redirect_to root_path
    end
  end

  def test
    redirect_to :test
  end

  private

  def require_current_user
    redirect_to sign_in_path if current_user.nil?
  end

  def add_redis_keys
    $redis.sadd("weather_machine",@current_request_key)
    $redis.sadd(@current_request_key, params[:stations])
    $redis.sadd(@current_request_key, params[:start][:date])
    $redis.sadd(@current_request_key, "Sent to Data Ingestor")
  end

  def call_data_ingestor
    uri = URI(RAIN_GAUGE[Rails.env])
    uri.query = URI.encode_www_form(:stations => params[:stations], :date => params[:start][:date], :redis_key => @current_request_key)
    Net::HTTP.get_response(uri)
  end

end