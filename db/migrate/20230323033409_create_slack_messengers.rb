class CreateSlackMessengers < ActiveRecord::Migration[7.0]
  def change
    create_table :slack_messengers do |t|
      t.string :name, null: false
      t.string :id_on_slack, null: false, index: true
      t.timestamps
    end
  end
end
