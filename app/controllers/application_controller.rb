class ApplicationController < ActionController::Base
    before_action :set_locale #Helper "before_action"es decir, antes de cualquier accion llama al metodo set_locate por medio de su simbolo

    def set_locale#Esta accion o metodo indica el idioma que esta en config/locales/es.yml
        I18n.locale = 'es'
    end
end
