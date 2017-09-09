class CreatePokemonBattles < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemon_battles do |t|
      t.references :pokemon, foreign_key: true
      t.references :battle, foreign_key: true

      t.timestamps
    end
  end
end
