require 'rails_helper'

feature "User can visit the root page and see a welcome page" do
  scenario "a user visits the home page and sees the welcome page" do
    user = User.create(name: "test", email: "test@test.com", password: "testing")
    # need to figure out how to actually have capybara logged in.
    # Could possibly set the session[user_id] right in capybara.
    visit '/'

    expect(page).to have_link(battle_path)
    expect(page).to have_link(pokemon_db_path)
    expect(page).to have_link(logout_path)

    expect(page).to_not have_link(analysis_path)
    expect(page).to_not have_link(new_user_path)
    expect(page).to_not have_link(login_path)
  end

  scenario "When a user clicks on the battle page link" do
    user = User.create(name: "test", email: "test@test.com", password: "testing")
    # need to figure out how to actually have capybara logged in.
    # Could possibly set the session[user_id] right in capybara.
    pokemon_1 = Pokemon.create(name: "Pikachu", health: 100, attack: 100, speed: 200)
    pokemon_2 = Pokemon.create(name: "Clefairy", health: 200, attack: 50, speed: 100)

    visit '/'

    click_on "The Battle Page"

    expect(page)

    select pokemon_1.name, from: "player[pokemon_id]"
    select pokemon_2.name, from: "cpu[pokemon_id]"
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
