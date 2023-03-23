class ChangeChannelIdColumnNameOfSlackChannelsTable < ActiveRecord::Migration[7.0]
  def up 
    add_column :slack_channels, :id_on_slack, :string
    SlackChannel.update_all("id_on_slack=channel_id")
    remove_index :slack_channels, column: :channel_id
    remove_column :slack_channels, :channel_id
    add_index :slack_channels, :id_on_slack
  end

  def down
    add_column :slack_channels, :channel_id, :string
    SlackChannel.update_all("channel_id=id_on_slack")
    remove_index :slack_channels, column: :id_on_slack
    remove_column :slack_channels, :id_on_slack
    add_index :slack_channels, :channel_id
  end
end
