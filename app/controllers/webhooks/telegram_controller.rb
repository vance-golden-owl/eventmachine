module Webhooks 
  class TelegramController < ApplicationController 
    def endpoint 
      TelegramMessageForwardJob.perform_later(permitted_params)
    end

    private 

    def permitted_params
      params.permit!
    end
  end
end