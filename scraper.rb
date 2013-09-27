require 'rubygems'
require 'json'
require 'rss'
require 'open-uri'
require 'active_support/all'
require 'net/http'
require 'nokogiri'

url = "http://www.waze.com/rtserver/web/GeoRSS?format=JSON&mj=10&ma=10&jmds=120&jmu=0&left=-9902228.4683365&right=-9233863.0931305&bottom=4707736.5908183&top=5045282.5076653&sc=1733376&pr=Mercator"


#uri = URI.parse(url)
#request = Net::HTTP::Post.new(uri.path)
#response = Net::HTTP.new(uri.host, uri.port).start{ |http| http.request(request) }
#puts response.body
f = File.open("response.txt", 'r')
doc = Nokogiri::XML(f)
#f.write(response.body)
#f.close

puts doc.at('linqmap:type').detect{ |i| i.text == "POLICEMAN" }

feed = RSS::Parser.parse(f, false)
puts "TITLE: #{feed.channel.title}"
puts "ITEM:"
puts feed.items.first
cop = feed.items.detect{ |i| i.send(:"linqmap:type") == "POLICEMAN" }
puts "COP:"
puts cop

#open(url) do |rss|
#  feed = RSS::Parser.parse(rss)
#  if feed.present?
#    puts "Title: #{feed.channel.title}"
#    feed.items.each do |item|
#      puts "Item: #{item.title}"
#    end
#  else
#    json = JSON.parse(rss.read)
#    puts rss.read
#  end
#end
