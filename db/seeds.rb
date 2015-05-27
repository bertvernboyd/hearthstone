# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

player_classes = 
  ['Druid', 'Hunter', 'Mage', 'Paladin', 'Priest', 'Rogue', 'Shaman', 'Warlock', 'Warrior']

Score.delete_all
Card.delete_all

CSV.foreach("./lib/assets/csv/cards.csv", :headers => true) do |row|
  params = {
             tag:          row['tag'], 
             name:         row['name'], 
             card_type:    row['type'], 
             rarity:       row['rarity'], 
             cost:         row['cost'].to_i,
             attack:       row['attack'].to_i,
             health:       row['health'].to_i,
             player_class: row['playerClass']
           }
  Card.create(params)  
end

CSV.foreach("./lib/assets/csv/scores.csv", :headers => true) do |row|
  player_classes.each do |player_class|
    params = {
      player_class: player_class,
      value:        row["#{player_class}.value"],
      card:         Card.find_by(name: row["#{player_class}.name"])
    }
    Score.create(params) 
  end
end  
