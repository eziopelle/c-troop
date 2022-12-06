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
user_1 = User.create!(email: "victor@email.com", password: "victor1234")
file =  URI.open("https://ca.slack-edge.com/T02NE0241-U045E6YAM2T-182bcc445d87-512")
user_1.photo.attach(io: file, filename: "avatar-victor.png", content_type: "image/png")
user_1.save
user_2 = User.create!(email: "mario@email.com", password: "mario1234")
file =  URI.open("https://ca.slack-edge.com/T02NE0241-U046HLA718Q-6b693044323c-512")
user_2.photo.attach(io: file, filename: "avatar-mario.png", content_type: "image/png")
user_2.save
user_3 = User.create!(email: "alassane@email.com", password: "alassane1234")
file =  URI.open("https://ca.slack-edge.com/T02NE0241-U046K6FQVUG-92244e9429cd-512")
user_3.photo.attach(io: file, filename: "avatar-alassane.png", content_type: "image/png")
user_3.save
user_4 = User.create!(email: "maxence@email.com", password: "maxence1234")
file =  URI.open("https://ca.slack-edge.com/T02NE0241-U045WD5DGG4-120949574827-512")
user_4.photo.attach(io: file, filename: "avatar-maxence.png", content_type: "image/png")
user_4.save
price_level = [258, 263, 240, 228, 260, 253, 228, 255, 247, 248, 258, 258, 238, 228, 250, 260, 281, 237, 260, 281, 237, 260, 243, 260, 268, 232, 226, 235]
average = price_level.sum / price_level.size.to_f


puts "========= CREATION DES MARKETS MANO ========="
Market.create!(brand: "Auchan", address: "48, Bis Rue Saint Sébastien 59000 - Lille", price_level: 258 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "5, Rue de Saint André 59000 - Lille", price_level: 263 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Carrefour Market", address: "Rue du Pré Catelan 59110 - La Madeleine", price_level: 240 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Leclerc", address: "2, Place Louise de Bettignies 59000 - Lille", price_level: 228 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "9, Rue de Roubaix 59000 - Lille", price_level: 260 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "53, Rue Pierre Mauroy 59000 - Lille", price_level: 253 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "42, Rue Molinel 59000 - Lille", price_level: 228 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "6, Rue Palais Rihour 59000 - Lille", price_level: 255 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Intermarché Express", address: "89-95, Rue Nationale 59000 - Lille", price_level: 247 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "26, Boulevard de la Liberté - Lille", price_level: 248 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "33, Avenue JF Kennedy - La Madeleine", price_level: 258 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "43, Boulevard Vauban - Lille", price_level: 258 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "171, Rue Nationale - Lille", price_level: 238 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Leclerc", address: "107, Rue Solférino 59000 - Lille", price_level: 228 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Intermarché Express", address: "75-77, Rue Léon Gambetta - Lille", price_level: 250 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan ", address: "323, Rue du Président Hoover 59000 - Lille", price_level: 260 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Carrefour", address: "281, Rue Léon Gambetta - Lille", price_level: 281 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "14, Place Nouvelle Aventure - Lille", price_level: 237 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Auchan", address: "35, Rue d’Isly - Lille", price_level: 260 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Leclerc", address: "41, Boulevard de la Moselle 59000 - Lille", price_level: 243 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Intermarché Express", address: "105, Rue du Faubourg de Roubaix - Lille", price_level: 260 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "U Express", address: "51, Rue du Buisson 59000 - Lille", price_level: 268 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Intermarché Super", address: "25, Rue Franklin 59000 - Lille", price_level: 232 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Leclerc", address: "94, Rue de Lannoy - Lille", price_level: 226 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Carrefour Market", address: "268, Rue Pierre Legrand Fives - Lille", price_level: 235 / average, opening_hours: "pas d'horaires")
Market.create!(brand: "Carrefour Market", address: "Lille Gambetta", price_level: 5.49 / average, opening_hours: "pas d'horaires")


url = URI("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=50.630,3.060&radius=2500&type=supermarket&key=#{ENV['GOOGLE_API_KEY']}")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)

rep = JSON.parse(response.read_body)

results = rep["results"]

results.each do |result|
  puts "========= MARKET LAT LNG NAME GOOGLE_ID ========="
  sleep 2
  lat = result["geometry"]["location"]['lat']
  lng = result["geometry"]["location"]['lng']
  name = result["name"]
  google_id = result["place_id"]
  #if name != "Garden &shop (anciennement le Minh)" || name != "Picard"
    geo_localization = "#{lat},#{lng}"
    location = Geocoder.search(geo_localization).first
    address = "#{location.house_number} #{location.street} #{location.city}"
    Market.create!(brand: name, latitude: lat, longitude: lng, google_id: google_id, address: address)
  #end
end

Market.all.each do |market|
  puts "========= CHARGEMENT DES HORAIRES ========="
  sleep 12
  url = URI("https://maps.googleapis.com/maps/api/place/details/json?fields=name%2Crating%2Cformatted_phone_number%2Copening_hours&place_id=#{market.google_id}&key=#{ENV['GOOGLE_API_KEY']}")

  https = Net::HTTP.new(url.host, url.port)
  https.use_ssl = true

  request = Net::HTTP::Get.new(url)

  response = https.request(request)

  rep = JSON.parse(response.read_body)

  if rep["opening_hours"] != nil || market.opening_hours == nil
    opening_hour = rep["result"]["opening_hours"]["weekday_text"].join(" ")
    market.update(opening_hours: opening_hour)
  else
    market.update(opening_hours: "pas d'horaires")
  end

end

puts "========= GENERATION DES PRODUITS ========="

Product.create!(name: "cristalline 6x1,5L", mean_price: "1.20")
Product.create!(name: "Coca-Cola 1,75L", mean_price: "1.95")
Product.create!(name: "Nutella Pâte à tartiner 1kg", mean_price: "5.59")
Product.create!(name: "Caprice des Dieux 300g", mean_price: "3.25")
Product.create!(name: "Nutella Pâte à tartiner 825g", mean_price: "4.65")
Product.create!(name: "Président Beurre doux 250g", mean_price: "1.49")
Product.create!(name: "Carte Noire Café 3x250g", mean_price: "11.09")
Product.create!(name: "Catsan Litière Hygiène Plus 10L", mean_price: "4.89")
Product.create!(name: "Lotus Confort Papier Toilette x24", mean_price: "9.59")
Product.create!(name: "Sodebo Salade & Cie Manhattan", mean_price: "2.79")
Product.create!(name: "Herta Le Bon Paris 4 tranches", mean_price: "3.0")
Product.create!(name: "Pâtes coquillettes BARILLA", mean_price: "1.09")
Product.create!(name: "Pâtes coquillettes PANZANI", mean_price: "1.95")
Product.create!(name: "Pâtes penne rigate BARILLA", mean_price: "1.05")
Product.create!(name: "Pâtes spaghetti PANZANI", mean_price: "1.05")
Product.create!(name: "Pâtes torti PANZANI", mean_price: "1.99")
Product.create!(name: "Pâtes linguine collezione BARILLA", mean_price: "1.19")
Product.create!(name: "Pâtes spaghetti bio BARILLA", mean_price: "1.85")
Product.create!(name: "Filets de poulet blanc LE GAULOIS x2", mean_price: "4.65")
Product.create!(name: "Escalopes de dinde LE GAULOIS x2", mean_price: "10.19")
Product.create!(name: "Cordon bleu poulet LE GAULOIS x2", mean_price: "2.05")
Product.create!(name: "Cordon bleu de dinde PERE DODU x2", mean_price: "2.29")
Product.create!(name: "Steak haché viande bovine 5% MG CHARAL x2", mean_price: "5.10")
Product.create!(name: "Steak haché pur bœuf 15% MG CHARAL x10", mean_price: "1.09")
Product.create!(name: "Viande Bovine: Pavé à griller CHARAL x2", mean_price: "8.21")
Product.create!(name: "Huile Isio 4 ISIO 4", mean_price: "3.69")
Product.create!(name: "Huile d'olive vierge extra PUGET 1l", mean_price: "8.79")
Product.create!(name: "Sel fin iodé CEREBOS", mean_price: "0.88")
Product.create!(name: "Sel de Guérande Label Rouge LE GUERANDAIS", mean_price: "2.49")
Product.create!(name: "Poivre et épices DUCROS", mean_price: "2.05")
Product.create!(name: "Blanc de poulet réduit en sel FLEURY MICHON x2", mean_price: "2.69")
Product.create!(name: "Ketchup HEINZ 250g", mean_price: "1.16")
Product.create!(name: "Ketchup AMORA", mean_price: "1.45")
Product.create!(name: "Moutarde ancienne MAILLE", mean_price: "2.95")
Product.create!(name: "Moutarde douce AMORA", mean_price: "1.09")
Product.create!(name: "Parmigiano Reggiano AOP CASA AZZURRA", mean_price: "1.29")
Product.create!(name: "Fromage à Tartiner Nature ST MORET", mean_price: "2.25")
Product.create!(name: "Fromage Crème à tartiner KIRI", mean_price: "2.79")
Product.create!(name: "Fromage Râpé Emmental PRESIDENT Maxi Format", mean_price: "1.99")
Product.create!(name: "Fromage Râpé Comté AOP ENTREMONT", mean_price: "2.59")
Product.create!(name: "Mozzarella GALBANI", mean_price: "1.19")
Product.create!(name: "SAUCE TOMATES BASILIC BARILLA 400g", mean_price: "1.55")
Product.create!(name: "SAUCE BOLOGNAISE RICHE BARILLA 400g", mean_price: "2.99")
Product.create!(name: "SAUCE PESTO ROSSO BARILLA", mean_price: "2.19")
Product.create!(name: "Crème Epaisse Légère 15% Mat.Gr. BRIDELICE 20cl", mean_price: "0.74")
Product.create!(name: "Crème Semi-épaisse Légère 18% Mat.Gr. BRIDELICE", mean_price: "2.89")
Product.create!(name: "Pâtes Fraîches Gnocchi à Poêler LUSTUCRU SELECTION", mean_price: "1.49")
Product.create!(name: "Box Fusilli bolognaise SODEBO", mean_price: "2.59")
Product.create!(name: "Lardons fumés sel réduit HERTA - 25% sel", mean_price: "2.19")
Product.create!(name: "Œufs Bio Calibre Moyen Sans-Antibiotique Sans OGM LOUE x6", mean_price: "5.69")
Product.create!(name: "Œufs Calibre Moyen Label Rouge Sans OGM LOUE x12", mean_price: "4.79")
Product.create!(name: "Œufs Gros Coque Calibre Gros LUSTUCRU x6", mean_price: "2.09")
Product.create!(name: "Biscuits fourrés au chocolat au blé complet Prince LU", mean_price: "3.79")
Product.create!(name: "Blanc de poulet réduit en sel FLEURY MICHON x2", mean_price: "2.69")
Product.create!(name: "Ketchup HEINZ 250g", mean_price: "1.16")
Product.create!(name: "Ketchup AMORA", mean_price: "1.45")
Product.create!(name: "Moutarde ancienne MAILLE", mean_price: "2.95")

puts "========= AJOUT DES MARKET PRODUCTS ========="

Market.all.each do |market|
  random = [0.9, 1.10, 0.8, 1.20, 1.40, 0.7, 0.85, 0.90, 1.12, 1.30].sample
  if market.price_level == nil
    Product.all.each do |product|
      random_price_level = random
      MarketProduct.create!(product_id: product.id, market_id: market.id, price: product.mean_price * random_price_level)
      market.update(price_level: random_price_level)
    end
  else
    Product.all.each do |product|
      MarketProduct.create!(product_id: product.id, market_id: market.id, price: product.mean_price * market.price_level)
    end
  end
end

puts "========= JE SUIS ECOEURE ========="
