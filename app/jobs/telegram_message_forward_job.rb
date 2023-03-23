class TelegramMessageForwardJob < ApplicationJob 
  queue_as :default 

  def perform(params)
    message_sent = params[:message][:reply_to_message][:text]
    channel_id_and_name = message_sent.split("/")[0]
    channel_id = channel_id_and_name.split("-")[0]

    reply_content = params[:message][:text]
    
    client = Slack::Web::Client.new 
    client.chat_postMessage(
      channel: channel_id,
      text: reply_content
    )
  end
end