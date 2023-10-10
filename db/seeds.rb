# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Coin.create!(
    description: "Dogecoin",
    acronym: "DOGE",
    url_image: "https://i.ibb.co/sgb17NS/pngwing-com.png"
)
Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/5/50/Bitcoin.png"
)
Coin.create!(
    description: "ETHEREUM",
    acronym: "ETH",
    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
)