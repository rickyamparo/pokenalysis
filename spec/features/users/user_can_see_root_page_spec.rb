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
end
