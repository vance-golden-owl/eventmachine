class CreateSlackUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :slack_users do |t|
      t.string :name, null: false 
      t.string :user_id, null: false, index: true
      t.timestamps
    end
  end
end
