require 'rails_helper'

feature 'visitor can register account' do
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
    expect(User.all.count).to eq(1)
  end
  # need a sad path for when registering fails
end
