class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :tag
      t.string :name
      t.string :card_type
      t.string :rarity
      t.integer :cost
      t.integer :attack
      t.integer :health
      t.string :player_class

      t.timestamps
    end
  end
end
