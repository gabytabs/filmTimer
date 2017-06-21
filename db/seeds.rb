# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'
source = open("http://www.digitaltruth.com/chart/print.php")
page = Nokogiri::HTML(source)
puts "hi"

page.css('td a').each do |link|
  newSource = open("http://www.digitaltruth.com/" + link['href'])
  page = Nokogiri::HTML(newSource)
  page.search("tr").each do |film|
    tds  = film.xpath('td[1]')
    Film.create("name"=> film.xpath('td[1]').text, "developer"=>film.xpath('td[2]').text, "dilution"=>film.xpath('td[3]').text, "ISO"=>film.xpath('td[4]').text, "film35mm"=>film.xpath('td[5]').text, "film120"=>film.xpath('td[6]').text, "sheet"=>film.xpath('td[7]').text, "temp"=>film.xpath('td[8]').text )
    puts film.xpath('td[1]').text
  end

end

