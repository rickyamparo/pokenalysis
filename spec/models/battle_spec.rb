require 'rails_helper'

feature Battle do
  feature "validations" do
    context "invalid attributes" do

      scenario "is invalid without a winner" do
        battle = Battle.new(pokemon_1: "Rhydon", pokemon_2: "Bulbasaur")
        expect(battle).to be_invalid
      end

      scenario "is invalid without pokemon_1" do
        battle = Battle.new(winner: "Rhydon", pokemon_2: "Bulbasaur")
        expect(battle).to be_invalid
      end

      scenario "is invalid without pokemon_2" do
        battle = Battle.new(winner: "Rhydon", pokemon_1: "Bulbasaur")
        expect(battle).to be_invalid
      end
    end

    context "valid attributes" do
       scenario "is valid with a winner, pokemon_1 and pokemon_2" do
         battle = Battle.new(winner: "Rhydon",pokemon_1: "Rhydon", pokemon_2: "Bulbasaur")
         expect(battle).to be_valid
       end
    end
  end
end
