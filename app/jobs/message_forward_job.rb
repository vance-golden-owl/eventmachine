class MessageForwardJob < ApplicationJob
  queue_as :default

  def perform(params)
    team_id = params[:event][:team]
    channel_id = params[:event][:channel]
    user_id = params[:event][:user]
    message_content = params[:event][:text]

    client = Slack::Web::Client.new
    user_info = client.users_info(user: user_id)
    username = user_info&.user&.name || 'Unknown'

    Telegram::SendMessageService.call(
      "#{team_id}-#{channel_id}-#{username}: #{message_content}"
    )
  end
end
