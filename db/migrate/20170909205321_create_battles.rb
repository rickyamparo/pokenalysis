class CreateBattles < ActiveRecord::Migration[5.1]
  def change
    create_table :battles do |t|
      t.string :winner
      t.string :pokemon_1
      t.string :pokemon_2

      t.timestamps
    end
  end
end
