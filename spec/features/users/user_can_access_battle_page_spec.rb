require 'rails_helper'

feature 'User can access and use the battle page' do
  scenario "When a user clicks on the battle page link" do
    user = User.create(name: "test", email: "test@test.com", password: "testing")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    pokemon_1 = Pokemon.create(name: "Pikachu", health: 100, power: 100, speed: 200)
    pokemon_2 = Pokemon.create(name: "Clefairy", health: 200, power: 50, speed: 100)

    visit '/'

    click_on "The Battle Page"

    expect(current_path).to eq('/battle')

    select pokemon_1.name, from: "post[pokemon_1_id]"
    select pokemon_2.name, from: "post[pokemon_2_id]"

    click_on "Battle"

    expect(page).to have_content("#{pokemon_1.name} was the winner")
  end
end
