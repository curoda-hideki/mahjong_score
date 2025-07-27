class CreateScores < ActiveRecord::Migration[7.2]
  def change
    create_table :scores do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
