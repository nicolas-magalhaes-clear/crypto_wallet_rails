coins = [
          {
            description: "Dogecoin",
            acronym: "DOGE",
            url_image: "https://i.ibb.co/sgb17NS/pngwing-com.png"
          },
          {
            description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://upload.wikimedia.org/wikipedia/commons/5/50/Bitcoin.png"
          },
          {
            description: "ETHEREUM",
            acronym: "ETH",
            url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png"
          },
        ]


coins.each do |coin|
    Coin.find_or_create_by!(coin)
end


