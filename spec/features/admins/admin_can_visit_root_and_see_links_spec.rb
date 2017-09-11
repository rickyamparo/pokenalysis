require 'rails_helper'

feature "Admin can visit the root page and see a welcome page" do
  scenario "an admin has the role of admin" do
    admin = User.create(name: "test", email: "test@test.com", password: "testing", role: 1)

    expect(admin.role).to eq("admin")
  end
end
