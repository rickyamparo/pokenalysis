require 'rails_helper'

feature Pokemon do
  feature "validations" do
    context "invalid attributes" do

      scenario "is invalid without a name" do
        pokemon = Pokemon.new(health: 100, power: 100, speed: 100)
        expect(pokemon).to be_invalid
      end

      scenario "is invalid without health" do
        pokemon = Pokemon.new(name: "Pikachu", power: 100, speed: 100)
        expect(pokemon).to be_invalid
      end

      scenario "is invalid without power" do
        pokemon = Pokemon.new(name: "Pikachu", health: 100, speed: 100)
        expect(pokemon).to be_invalid
      end

      scenario "is invalid without speed" do
        pokemon = Pokemon.new(name: "Pikachu", health: 100, power: 100)
        expect(pokemon).to be_invalid
      end

    end

    context "valid attributes" do
      scenario "is valid with name, health, power, speed attributes" do
        pokemon = Pokemon.new(name: "Pikachu", health: 100, power: 100, speed: 100)
        expect(pokemon).to be_valid
      end
    end
  end
end
