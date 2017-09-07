require 'rails_helper'

feature "Visitor can visit the root and see a welcome page" do
  scenario "a visitor visits the home page and sees the welcome page" do
    visit "/"

    expect(page).to have_link(new_user_path)
    expect(page).to have_link(login_path)

    expect(page).to_not have_link(battle_path)
    expect(page).to_not have_link(pokemon_db_path)
    expect(page).to_not have_link(analysis_path)
  end

  scenario "a visitor can click on register account to fill out an account form" do
    visit '/'

    click_on "Register Account"

    expect(current_path).to eq(new_user_path)

    fill_in "user[name]", with: "test"
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "testing"

    click_on "Create User"

    expect(current_path).to eq("/")
    expect(page).to have_content "Your account was successfully created"
    # This needs to be a flash message
  end

  scenario "A visitor can click on login to log into account" do
    user = User.create(name: "test", email: "test@test.com", password: "testing")

    visit '/'

    click_on "Login User"

    expect(current_path).to eq(login_path)

    fill_in "user[email]", with: "test@test.com"
    fill_in "user[password]", with: "testing"

    click_on "Login"

    expect(current_path).to eq("/")
    expect(page).to have_content "Hello #{user.name}, you are now signed in"
    # This needs to be a flash message
    # Maybe you can even expect the session hash to have the user_id key
  end
end
