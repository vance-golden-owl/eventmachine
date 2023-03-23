class CreateTelegramGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :telegram_groups do |t|
      t.string :name 
      t.string :id_on_telegram 
      t.references :user
      t.timestamps
    end
  end
end
