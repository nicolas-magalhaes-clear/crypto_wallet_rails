module ApplicationHelper

    def locale(locale)
        if I18n.locale == :en
            "Estados unidos"
        else
            'Brasil'
        end
    end

    def data_br(data_us)
        data_us.strftime('%d/%m/%Y')
    end

    def nome_aplicacao
        "CRYPTO WALLET APP"
    end

    def ambiente_rails

        if Rails.env.development?
            t('dev')
        elsif Rails.env.production?
            t('prod')
        else
            t('test')
        end
    end
end
