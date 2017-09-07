class CreatePokemons < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :health
      t.integer :power
      t.integer :speed

      t.timestamps
    end
  end
end
