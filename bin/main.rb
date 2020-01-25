#! /usr/bin/env ruby
require 'nokogiri'
require 'watir'
require 'webdrivers'
require 'json'

require_relative '../lib/currency_scraper.rb'
require_relative '../config/config.rb'


def obtain_nokogiri(site, code)
  if (code.start_with? 'Watir::Wait.until { browser.') && (code.end_with? '.exists? }')
    browser = Watir::Browser.new
    browser.goto site
    browser.refresh
    eval(code)
    Nokogiri::HTML(browser.html)
  else
    puts "Wrong Code Format String"
  end
end

#banamexnokogiri = obtain_nokogiri(Config::banamexsite, Config::banamexcode)
#puts "Banamex Compra: #{banamexnokogiri.css('div#dat_divisas div p')[1].text}"
#puts "Banamex Venta: #{banamexnokogiri.css('div#dat_divisas div p')[2].text}"

Config::sites.each {|elem|
  puts elem[1]
}

Config::codes.each {|elem|
  puts elem[1]
}