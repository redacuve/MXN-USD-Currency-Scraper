# rubocop:disable Security/Eval
require 'nokogiri'
require 'watir'
require 'webdrivers'
require_relative '../config/config.rb'

module Scraper
  def self.obtain_nokogiri(browser,site, code)
    if (code.start_with? 'Watir::Wait.until { browser.') && (code.end_with? '.exists? }')
      browser.goto site
      browser.refresh
      eval(code)
      Nokogiri::HTML(browser.html)
    else
      puts 'Wrong Code Format String'
    end
  end

  def self.convert_number(number)
    number.to_f.round(2)
  end

  def self.fillnokogiris
    browser = Watir::Browser.new
    nokogiris = []
    (0...Config.sites.length).each_with_index { |i| 
      nokogiris.push(obtain_nokogiri(browser,Config.sites.values[i], Config.codes.values[i]))
    }
    nokogiris
  end
end
# rubocop:enable Security/Eval
