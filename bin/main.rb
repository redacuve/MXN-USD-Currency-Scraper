#! /usr/bin/env ruby
require 'json'
require 'date'
require_relative '../lib/scraper.rb'
require_relative '../config/config.rb'

row = []
puts 'Obtaining data from the pages, please wait until the browser is close...'
nokogiris = Scraper.fillnokogiris
puts 'Data obtained.'
row.push(Scraper.convert_number(nokogiris[0].css('div#dat_divisas div p')[1].text))
row.push(Scraper.convert_number(nokogiris[0].css('div#dat_divisas div p')[2].text))
row.push(Scraper.convert_number(nokogiris[1].css('table.tbl-info-financiera tbody tr td')[15].text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[1].css('table.tbl-info-financiera tbody tr td')[16].text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[2].css('div.wrapper-cambio div.col-4 span#cusa').text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[2].css('div.wrapper-cambio div.col-4 span#vusa').text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[3].css('section.stockUpdater ul.column4 li')[1].css('span')[0].text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[3].css('section.stockUpdater ul.column4 li')[1].css('span')[1].text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[4].css('table#tablaDolar tbody tr td')[1].text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[4].css('table#tablaDolar tbody tr td')[2].text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[5].css('div#Divisas td.text-center')[0].text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[5].css('div#Divisas td.text-center')[1].text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[6].css('table.t-divisas tbody tr')[0].css('td b')[1].text.match(/\d+\.\d+/).to_s))
row.push(Scraper.convert_number(nokogiris[6].css('table.t-divisas tbody tr')[1].css('td b')[1].text.match(/\d+\.\d+/).to_s))
banbajio_json = JSON.parse(nokogiris[7].css('input#jsonDivisas')[0].values[3], object_class: OpenStruct)
row.push(Scraper.convert_number(banbajio_json.divisas[7].compra))
row.push(Scraper.convert_number(banbajio_json.divisas[7].venta))
row.unshift(Time.now.strftime('%d-%m-%Y %H:%M:%S'))
Scraper.write_csv(row)
puts 'This is the data of the value of the USD in MXN'
Config.csv_header.each_with_index do |elem, i|
  if i.zero?
    puts "#{elem}:    \t#{row[i]}"
  else
    puts "#{elem}:    \t$#{format('%<price>.2f', price: row[i])} MXN"
  end
end
