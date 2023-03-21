module Telegram
  class SendMessageService < ApplicationService
    def initialize(text)
      @text = text
    end

    def call
      telegram_url = "#{ENV['TELEGRAM_BOT_BASE_URL']}sendMessage"
      HTTParty.post(
        telegram_url,
        body: {
          chat_id: ENV['TELEGRAM_BOT_CHANNEL_ID'],
          text: @text
        }.to_json,
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end
