class TelegramGroup < ApplicationRecord
  belongs_to :user

  validates :name, presence: true 
  validates :id_on_telegram, presence: true, uniqueness: true
end
