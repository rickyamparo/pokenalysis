require 'rails_helper'

feature 'User can access and use the pokemon database' do
  scenario "When a user clicks on the pokemon database link" do
    user = User.create(name: "test", email: "test@test.com", password: "testing")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    pokemon_1 = Pokemon.create(name: "Pikachu", health: 100, power: 100, speed: 200)
    pokemon_2 = Pokemon.create(name: "Clefairy", health: 200, power: 50, speed: 100)

    visit '/database'

    select pokemon_1.name, from: "post[pokemon_id]"

    click_on "Pull Up Stats"

    expect(page).to have_content "This pokemon's health is: 100"
    expect(page).to have_content "This pokemon's power is: 100"
    expect(page).to have_content "This pokemon's speed is: 200"

    expect(page).to_not have_content "This pokemon's health is: 200"
    expect(page).to_not have_content "This pokemon's power is: 50"
    expect(page).to_not have_content "This pokemon's speed is: 100"

    select pokemon_2.name, from: "post[pokemon_id]"

    click_on "Pull Up Stats"

    expect(page).to have_content "This pokemon's health is: 200"
    expect(page).to have_content "This pokemon's power is: 50"
    expect(page).to have_content "This pokemon's speed is: 100"

    expect(page).to_not have_content "This pokemon's health is: 100"
    expect(page).to_not have_content "This pokemon's power is: 100"
    expect(page).to_not have_content "This pokemon's speed is: 200"
  end

end
