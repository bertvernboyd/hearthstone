class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :player_class
      t.integer :value
      t.references :card, index: true

      t.timestamps
    end
  end
end
