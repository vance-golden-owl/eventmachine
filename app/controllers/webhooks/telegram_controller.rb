module Webhooks 
  class TelegramController < ApplicationController 
    def endpoint 
      puts params
    end
  end
end