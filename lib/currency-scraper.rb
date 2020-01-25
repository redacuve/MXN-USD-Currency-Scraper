require 'nokogiri'
require 'watir'
require 'webdrivers'

class Scraper
    def initialize()
        @browser = Watir::Browser.new
    end
end