json.array!(@cards) do |card|
  json.extract! card, :id, :tag, :name, :card_type, :rarity, :cost, :attack, :health, :player_class
  json.url card_url(card, format: :json)
end
