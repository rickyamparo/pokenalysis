require 'rails_helper'

feature "Visitor can visit the root and see a welcome page" do
  scenario "a visitor visits the home page and sees the welcome page" do
    visit "/"

    expect(page).to have_content("Welcome to the Pokenalysis App!")

    expect(page).to have_link("Log in")
    expect(page).to have_link("Register Account")

    expect(page).to_not have_link("The Battle Page")
    expect(page).to_not have_link("Pokemon Database")
    expect(page).to_not have_link("Battle Analysis")
  end
end
