class SlackChannel < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :channel_id, presence: true, uniqueness: true
end
