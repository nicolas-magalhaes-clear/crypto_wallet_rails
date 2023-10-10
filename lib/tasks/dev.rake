namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco") { %x(rails db:drop) }
      show_spinner("Criando banco") { %x(rails db:create) }
      show_spinner("Migrando banco") { %x(rails db:migrate) }
      show_spinner("Semeando banco") { %x(rails db:seed) }
      %x{rails dev:add_coins}
      %x{rails dev:add_m_types}
    else
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  private

  def show_spinner(msgStart, msgEnd = "(Concluído)")
    spinner = TTY::Spinner.new("[:spinner] #{msgStart}")
    spinner.auto_spin
    yield
    spinner.success("#{msgEnd}")
  end

  desc "Cadastro tipos mineração"
  task add_m_types: :environment do
    show_spinner("Cadastrando tipos de mineração") do
      mining_types = [
        {
              description: "Proof of work",
              acronym: "PoW",
            },
        {
              description: "Proof of stake",
              acronym: "PoS",
            },
        {
              description: "Proof of capacity",
              acronym: "PoC",
            },
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  desc "Cadastro de moedas"
  task add_coins: :environment do
    show_spinner("Criando moedas") do
      coins = [
        {
          description: "Dogecoin",
          acronym: "DOGE",
          url_image: "https://i.ibb.co/sgb17NS/pngwing-com.png",
        },
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://upload.wikimedia.org/wikipedia/commons/5/50/Bitcoin.png",
        },
        {
          description: "ETHEREUM",
          acronym: "ETH",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png",
        },
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end
end
