class MessageForwardJob < ApplicationJob
  queue_as :default

  def perform(params)
    @channel_id = params[:event][:channel]
    @user_id = params[:event][:user]
    @message_content = params[:event][:text]
    @client = Slack::Web::Client.new

    Telegram::SendMessageService.call(
      "#{slack_channel.name}/#{slack_user.name}: #{@message_content}"
    )
  end

  def slack_channel 
    channel = SlackChannel.find_by(channel_id: @channel_id)

    if channel.nil?
      channel_info = @client.conversations_info(channel: @channel_id)
      channel = SlackChannel.create(name: channel_info.channel.name, channel_id: @channel_id)
    end

    channel
  end

  def slack_user 
    user = SlackUser.find_by(user_id: @user_id)

    if user.nil?
      user_info = @client.users_info(user: @user_id)
      user = SlackUser.create(name: user_info.user.name, user_id: @user_id)
    end

    user
  end
end
