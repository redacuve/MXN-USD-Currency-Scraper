require 'nokogiri'
require 'watir'
require 'webdrivers'
require_relative '../lib/scraper.rb'
require_relative '../config/config.rb'

describe Scraper do
  let(:browser) { Watir::Browser.new }
  let(:site) { 'https://duckduckgo.com/' }
  let(:code) { 'Watir::Wait.until { browser.a(:class => "logo_homepage").exists? }' }
  let(:wrongcode) { 'wrongcode' }

  describe '#obtain_nokogiri' do
    it 'Display message if wrong code string is given' do
      expect(Scraper.obtain_nokogiri(browser, site, wrongcode)).to eq('Wrong Code Format String')
    end
  end

  describe '#convert_number' do
    it 'return a float number is a string is given' do
      expect(Scraper.convert_number('2')).to eql(2.0)
    end

    it 'return a float number even if a number is given' do
      expect(Scraper.convert_number(2)).to eql(2.0)
    end

    it 'return a float number rounded in two decimals' do
      expect(Scraper.convert_number('2.8765')).to eql(2.88)
    end

    it 'return 0 if a string of letters is given' do
      expect(Scraper.convert_number('abx')).to eql(0.0)
    end
  end

  describe '#fillnokogiris' do
    it 'return an array with filled with nokogiris' do
      expect(Scraper.fillnokogiris.class).to eql(Array)
    end
  end

  describe '#write_csv' do
    it 'Write in the csv if a row is given' do
      expect(Scraper.write_csv([1, 2, 3]).class).to eql(CSV)
    end

    it 'Return a message is a row is not an array' do
      expect(Scraper.write_csv('X')).to eql('No row given')
    end

    it 'Return a message is a row is given' do
      expect(Scraper.write_csv).to eql('No row given')
    end
  end
end
