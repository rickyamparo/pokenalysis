require 'rails_helper'

feature "Admin can visit the root page and see a welcome page" do
  scenario "an admin has the role of admin" do
    admin = User.create(name: "test", email: "test@test.com", password: "testing", role: 1)

    expect(admin.role).to eq("admin")
  end

  scenario "an admin visits the root page and sees all links" do
    admin = User.create(name: "test", email: "test@test.com", password: "testing", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/'

    expect(page).to have_link("The Battle Page")
    expect(page).to have_link("Pokemon Database")
    expect(page).to have_link("Logout")
    expect(page).to have_link("Battle Analysis")
    
    expect(page).to_not have_link("Register Account")
    expect(page).to_not have_link("Log in")
  end
end
