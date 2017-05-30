class Artist < ApplicationRecord
  validates :name, :image, presence: true

  has_many :toons
end
