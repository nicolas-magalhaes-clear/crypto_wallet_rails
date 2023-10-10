namespace :dev do
    desc "Configura o ambiente de desenvolvimento"
    task setup: :environment do
        if Rails.env.development?
            spinner = TTY::Spinner.new("[:spinner] Removendo banco")
            spinner.auto_spin
            %x(rails db:drop) 
            spinner.success('Remoção do banco completa!')

            spinner = TTY::Spinner.new("[:spinner] Criando banco...")
            spinner.auto_spin

            %x(rails db:create) 
            spinner.success('Criação do novo banco completa')


            spinner = TTY::Spinner.new("[:spinner] Migrando banco")
            spinner.auto_spin
            %x(rails db:migrate)
            spinner.success('Migração concluída')
            

            spinner = TTY::Spinner.new("[:spinner] Executando Seed initial")
            spinner.auto_spin
            %x(rails db:seed)
            spinner.success('Conclúido seeding')
        
        else

            puts "Você não está em ambiente de desenvolvimento"
        end
        
        

    end
end