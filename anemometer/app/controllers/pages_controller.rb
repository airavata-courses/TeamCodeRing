class PagesController < ApplicationController
  def index
    @station_list = YAML.load(File.read("config/station.yml"))
  end

end