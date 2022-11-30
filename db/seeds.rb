# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'
require "uri"
require "net/http"

Market.destroy_all

url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=50.630,3.060&radius=2000&type=supermarket&key=#{ENV['GOOGLE_API_KEY']}")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)

rep = JSON.parse(response.read_body)

results = rep["results"]

results.each do |result|
  puts "=========== RESULT -====================="
  sleep 5
  lat = result["geometry"]["location"]['lat']
  lng = result["geometry"]["location"]['lng']
  name = result["name"]
  google_id = result["place_id"]
  if name != "Garden &shop (anciennement le Minh)"
    Market.create!(brand: name, latitude: lat, longitude: lng, google_id: google_id)
  end
end

Market.all.each do |market|
  puts "=========== OPENING -====================="
  sleep 5
  url = URI("https://maps.googleapis.com/maps/api/place/details/json?fields=name%2Crating%2Cformatted_phone_number%2Copening_hours&place_id=#{market.google_id}&key=#{ENV['GOOGLE_API_KEY']}")

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)

  response = https.request(request)

  rep = JSON.parse(response.read_body)
  # p rep

  opening_hour = rep["result"]["opening_hours"]["weekday_text"].join(" ")
  market.update(opening_hours: opening_hour)

puts "================= TERMINE ===================="


end
