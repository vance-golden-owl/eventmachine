class SlackChannel < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :id_on_slack, presence: true, uniqueness: true
end
