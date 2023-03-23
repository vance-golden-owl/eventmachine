class MessageForwardJob < ApplicationJob
  queue_as :default

  def perform(params)
    @channel_id = params[:event][:channel]
    @messenger_id = params[:event][:user]
    @message_content = params[:event][:text]

    Telegram::SendMessageService.call(
      "#{slack_channel.name}/#{slack_messenger.name}: #{@message_content}"
    )
  end

  def slack_channel
    channel = SlackChannel.find_by(id_on_slack: @channel_id)

    if channel.nil?
      channel_info = client.conversations_info(channel: @channel_id)
      channel = SlackChannel.create(name: channel_info.channel.name, id_on_slack: @channel_id)
    end

    channel
  end

  def slack_messenger
    messenger = SlackMessenger.find_by(id_on_slack: @messenger_id)

    if messenger.nil?
      messenger_info = client.users_info(user: @messenger_id)
      messenger = SlackMessenger.create(name: messenger_info.user.name, id_on_slack: @messenger_id)
    end

    messenger
  end

  def client 
    Slack::Web::Client.new
  end
end
