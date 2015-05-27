class Card < ActiveRecord::Base
  has_many :scores
  validates :tag, :name, :card_type, :rarity, :cost, presence: true
  validates :tag, :name, uniqueness: true
end
