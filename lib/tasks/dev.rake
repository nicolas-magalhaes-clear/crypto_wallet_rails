namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco") { %x(rails db:drop) }
      show_spinner("Criando banco") { %x(rails db:create) }
      show_spinner("Migrando banco") { %x(rails db:migrate) }
      show_spinner("Semeando banco") { %x(rails db:seed) }
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
end
