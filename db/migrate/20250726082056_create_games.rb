class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.date :date

      t.timestamps
    end
  end
end
