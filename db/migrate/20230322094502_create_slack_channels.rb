class CreateSlackChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :slack_channels do |t|
      t.string :name, null: false
      t.string :channel_id, null: false, index: true 
      t.timestamps
    end
  end
end
