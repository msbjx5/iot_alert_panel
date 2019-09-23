class Device < ApplicationRecord
  validates :name, :mac, :cel, presence: true
end
