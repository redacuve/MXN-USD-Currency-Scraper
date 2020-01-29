#! /usr/bin/env ruby
require 'json'
require 'date'
require_relative '../lib/scraper.rb'
require_relative '../config/config.rb'

row = []
puts 'Obtaining data from the pages, please wait until the browser is close...'
nokogiris = Scraper.fillnokogiris
puts 'Data obtained.'
puts 'This is the data of the value of the USD in MXN.'
puts "Date:    \t#{Time.now.strftime('%d-%m-%Y %H:%M:%S')}"
exit if nokogiris[0].is_a? String
row.push(Scraper.convert_number(nokogiris[0].css('div#dat_divisas div p')[1].text))
puts "#{Config.names[0]} Buy:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
row.push(Scraper.convert_number(nokogiris[0].css('div#dat_divisas div p')[2].text))
puts "#{Config.names[0]} Sell:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
exit if nokogiris[1].is_a? String
row.push(Scraper.convert_number(nokogiris[1].css('table.tbl-info-financiera tbody tr td')[15].text.match(/\d+\.\d+/).to_s))
puts "#{Config.names[1]} Buy:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
row.push(Scraper.convert_number(nokogiris[1].css('table.tbl-info-financiera tbody tr td')[16].text.match(/\d+\.\d+/).to_s))
puts "#{Config.names[1]} Sell:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
exit if nokogiris[2].is_a? String
row.push(Scraper.convert_number(nokogiris[2].css('div.wrapper-cambio div.col-4 span#cusa').text.match(/\d+\.\d+/).to_s))
puts "#{Config.names[2]} Buy:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
row.push(Scraper.convert_number(nokogiris[2].css('div.wrapper-cambio div.col-4 span#vusa').text.match(/\d+\.\d+/).to_s))
puts "#{Config.names[2]} Sell:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
exit if nokogiris[3].is_a? String
row.push(Scraper.convert_number(nokogiris[3].css('section.stockUpdater ul.column4 li')[1].css('span')[0].text.match(/\d+\.\d+/).to_s))
puts "#{Config.names[3]} Buy:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
row.push(Scraper.convert_number(nokogiris[3].css('section.stockUpdater ul.column4 li')[1].css('span')[1].text.match(/\d+\.\d+/).to_s))
puts "#{Config.names[3]} Sell:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
exit if nokogiris[4].is_a? String
row.push(Scraper.convert_number(nokogiris[4].css('table#tablaDolar tbody tr td')[1].text.match(/\d+\.\d+/).to_s))
puts "#{Config.names[4]} Buy:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
row.push(Scraper.convert_number(nokogiris[4].css('table#tablaDolar tbody tr td')[2].text.match(/\d+\.\d+/).to_s))
puts "#{Config.names[4]} Sell:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
exit if nokogiris[5].is_a? String
row.push(Scraper.convert_number(nokogiris[5].css('table.t-divisas tbody tr')[0].css('td b')[1].text.match(/\d+\.\d+/).to_s))
puts "#{Config.names[5]} Buy:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
row.push(Scraper.convert_number(nokogiris[5].css('table.t-divisas tbody tr')[1].css('td b')[1].text.match(/\d+\.\d+/).to_s))
puts "#{Config.names[5]} Sell:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
exit if nokogiris[7].is_a? String
banbajio_json = JSON.parse(nokogiris[6].css('input#jsonDivisas')[0].values[3], object_class: OpenStruct)
row.push(Scraper.convert_number(banbajio_json.divisas[7].compra))
puts "#{Config.names[6]} Buy:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
row.push(Scraper.convert_number(banbajio_json.divisas[7].venta))
puts "#{Config.names[6]} Sell:    \t$#{format('%<price>.2f', price: row[row.size - 1])} MXN"
row.unshift(Time.now.strftime('%d-%m-%Y %H:%M:%S'))
Scraper.write_csv(row)
