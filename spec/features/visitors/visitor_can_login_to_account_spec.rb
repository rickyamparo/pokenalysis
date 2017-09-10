require 'rails_helper'

feature 'visitor can login to account' do
  scenario "a visitor can click on login to log into account" do
    user = User.create(name: "test", email: "test@test.com", password: "testing")

    visit '/'

    click_on "Log in"

    expect(current_path).to eq(login_path)

    fill_in "session[email]", with: "test@test.com"
    fill_in "session[password]", with: "testing"

    click_on "Login"

    expect(current_path).to eq("/")
    expect(page).to have_content "Hello #{user.name}, you are now signed in"
    # This needs to be a flash message
    # Maybe you can even expect the session hash to have the user_id key
  end
end
