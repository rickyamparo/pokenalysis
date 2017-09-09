require 'rails_helper'

feature "User can visit the root page and see a welcome page" do
  scenario "a user visits the home page and sees the welcome page" do
    user = User.create(name: "test", email: "test@test.com", password: "testing")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    expect(page).to have_link("The Battle Page")
    expect(page).to have_link("Pokemon Database")
    expect(page).to have_link("Logout")

    expect(page).to_not have_link("Battle Analysis")
    expect(page).to_not have_link("Register Account")
    expect(page).to_not have_link("Log in")
  end

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
    # need to create a drop down with .collection_select in the view
    # need to figure out how to keep drop downs as seperate items.

    click_on "Battle"

    expect(page).to have_content "#{pokemon_1.name} was the winner"
  end

  scenario "When a user clicks on the pokemon database link" do
    user = User.create(name: "test", email: "test@test.com", password: "testing")
    # need to figure out how to actually have capybara logged in.
    # Could possibly set the session[user_id] right in capybara.
    pokemon_1 = Pokemon.create(name: "Pikachu", health: 100, attack: 100, speed: 200)
    pokemon_2 = Pokemon.create(name: "Clefairy", health: 200, attack: 50, speed: 100)

    select pokemon_1.name, from: "pokedex[pokemon_id]"

    expect(page).to have_content "Health = 100"
    expect(page).to have_content "Attack = 100"
    expect(page).to have_content "Speed = 100"

    expect(page).to_not have_content "Health = 200"
    expect(page).to_not have_content "Attack = 50"
    expect(page).to_not have_content "Speed = 100"

    select pokemon_2.name, from: "pokedex[pokemon_id]"

    expect(page).to have_content "Health = 200"
    expect(page).to have_content "Attack = 50"
    expect(page).to have_content "Speed = 100"

    expect(page).to_not have_content "Health = 100"
    expect(page).to_not have_content "Attack = 100"
    expect(page).to_not have_content "Speed = 100"
  end

end
