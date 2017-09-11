require 'rails_helper'

feature "Admin can visit Battle Analysis Page" do
  scenario "an admin visits the analysis page" do
    admin = User.create(name: "test", email: "test@test.com", password: "testing", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/'

    click_on "Battle Analysis"

    expect(current_path).to eq(battle_analysis_path)
  end

  scenario "an admin can select users and view their battles" do
    admin = User.create(name: "test", email: "test@test.com", password: "testing", role: 1)

    user_1 = User.create(name: "ricky", email: "ricky@ricky.com", password: "rickying")
    user_2 = User.create(name: "stu", email: "stu@stu.com", password: "stuing")

    pokemon_1 = Pokemon.create(name: "Pikachu", health: 100, power: 100, speed: 200)
    pokemon_2 = Pokemon.create(name: "Clefairy", health: 200, power: 50, speed: 100)

    battle = Battle.create(winner: pokemon_1, pokemon_1: pokemon_1.name, pokemon_2: pokemon_2.name)

    PokemonBattle.create(pokemon: pokemon_1, battle: battle)
    PokemonBattle.create(pokemon: pokemon_2, battle: battle)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/'

    click_on "Battle Analysis"

    select user_1.email, from: "post[user_id]"

    click_on "Inspect"

    expect(page).to have_content "This user's name is ricky"
    expect(page).to have_content "This user's email is ricky@ricky.com"
    expect(page).to have_content "This user's role is default"
  end
end
