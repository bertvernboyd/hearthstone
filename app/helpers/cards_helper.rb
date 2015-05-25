module CardsHelper
  def player_classes
    ['Druid', 'Hunter', 'Mage', 'Paladin', 'Priest', 'Rogue', 'Shaman', 'Warlock', 'Warrior']
  end
  
  def player_class_colour player_class
    colours = {}
    colours['Druid'] = "#a5754a"
    colours['Hunter'] = "#429242"
    colours['Mage'] = "#929bbe"
    colours['Paladin'] = "#e7be4a"
    colours['Priest'] = "#e7ebef"
    colours['Rogue'] = "#3c3334"
    colours['Shaman'] = "#5259a5"
    colours['Warlock'] = "#8a6097"
    colours['Warrior'] = "#953331"
    colours[player_class]
  end

  

end
