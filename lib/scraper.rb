# rubocop:disable Security/Eval,Style/RescueStandardError
require 'nokogiri'
require 'watir'
require 'webdrivers'
require 'csv'
require_relative '../config/config.rb'

module Scraper
  def self.obtain_nokogiri(browser, site, code)
    if (code.start_with? 'Watir::Wait.until { browser.') && (code.end_with? '.exists? }')
      begin
        browser.goto site
        browser.refresh
        eval(code)
        Nokogiri::HTML(browser.html)
      rescue
        puts 'Check your internet connection'
        'Bad connection'
      end
    else
      'Wrong Code Format String'
    end
  end

  def self.convert_number(number)
    number.to_f.round(2)
  end

  def self.fillnokogiris
    browser = Watir::Browser.new
    nokogiris = []
    (0...Config.sites.length).each do |i|
      puts "Going to #{Config.sites.values[i]}"
      nokogiris.push(obtain_nokogiri(browser, Config.sites.values[i], Config.codes.values[i]))
    end
    nokogiris
  end

  def self.write_csv(row = nil)
    if row.is_a? Array
      if File.exist?(Config.path)
        CSV.open(Config.path, 'a') { |csv| csv << row }
      else
        csv_header = []
        csv_header.push('Date')
        Config.names.each do |name|
          csv_header.push("#{name} Buy:")
          csv_header.push("#{name} Sell:")
        end
        CSV.open(Config.path, 'w') do |csv|
          csv << csv_header
          csv << row
        end
      end
      puts "Data added to the file #{Config.path}"
    else
      'No row given'
    end
  end
end
# rubocop:enable Security/Eval,Style/RescueStandardError
