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
puts "========= DESTRUCTION DES MARKETS ========="
Product.destroy_all
puts "========= DESTRUCTION DES PRODUCTS ========="
User.destroy_all
puts "========= DESTRUCTION DES USERS ========="

puts "========= CREATION DES 4 USERS ========="
User.create!(email: "victor@email.com", password: "victor1234")
User.create!(email: "mario@email.com", password: "mario1234")
User.create!(email: "alassane@email.com", password: "alassane1234")
User.create!(email: "maxence@email.com", password: "maxence1234")

url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=50.630,3.060&radius=2500&type=supermarket&key=#{ENV['GOOGLE_API_KEY']}")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)

rep = JSON.parse(response.read_body)

results = rep["results"]

results.each do |result|
  puts "========= MARKET LAT LNG NAME GOOGLE_ID ========="
  sleep 5
  lat = result["geometry"]["location"]['lat']
  lng = result["geometry"]["location"]['lng']
  name = result["name"]
  google_id = result["place_id"]
  if name != "Garden &shop (anciennement le Minh)"
    geo_localization = "#{lat},#{lng}"
    location = Geocoder.search(geo_localization).first
    address = "#{location.house_number} #{location.street} #{location.city}"
    Market.create!(brand: name, latitude: lat, longitude: lng, google_id: google_id, address: address)
  end
end

Market.all.each do |market|
  puts "========= CHARGEMENT DES HORAIRES ========="
  sleep 10
  url = URI("https://maps.googleapis.com/maps/api/place/details/json?fields=name%2Crating%2Cformatted_phone_number%2Copening_hours&place_id=#{market.google_id}&key=#{ENV['GOOGLE_API_KEY']}")

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)

  response = https.request(request)

  rep = JSON.parse(response.read_body)

  opening_hour = rep["result"]["opening_hours"]["weekday_text"].join(" ")
  market.update(opening_hours: opening_hour)
end

puts "========= GENERATION DES 11 PRODUITS ========="
Product.create!(name: "cristalline 6x&,5L", mean_price: "")
Product.create!(name: "Coca-Cola 1,75L", mean_price: "")
Product.create!(name: "Nutella Pâte à tartiner 1kg", mean_price: "")
Product.create!(name: "Caprice des Dieux 300g", mean_price: "")
Product.create!(name: "Nutella Pâte à tartiner 825g", mean_price: "")
Product.create!(name: "Président Beurre doux 250g", mean_price: "")
Product.create!(name: "Carte Noire Café 3x250g", mean_price: "")
Product.create!(name: "Catsan Litière Hygiène Plus 10L", mean_price: "")
Product.create!(name: "Lotus Confort Papier Toilette x24", mean_price: "")
Product.create!(name: "Sodebo Salade & Cie Manhattan", mean_price: "")
Product.create!(name: "Herta Le Bon Paris 4 tranches", mean_price: "")
puts "========= JE SUIS ECOEURE ========="
