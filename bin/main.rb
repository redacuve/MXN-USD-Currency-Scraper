#! /usr/bin/env ruby
require 'nokogiri'
require 'watir'
require 'webdrivers'
require 'json'
require 'csv'

require_relative '../lib/scraper.rb'
require_relative '../config/config.rb'

nokogiris = Scraper.fillnokogiris
