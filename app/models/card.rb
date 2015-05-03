class Card < ActiveRecord::Base
  validates :tag, :name, :card_type, :rarity, :cost, presence: true
  validates :tag, :name, uniqueness: true
end
