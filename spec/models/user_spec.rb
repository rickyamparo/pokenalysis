require 'rails_helper'

feature User do
  feature "validations" do
    context "invalid attributes" do

      scenario "is invalid without a name" do
        user = User.new(email: "test@test.com", password: "testing")
        expect(user).to be_invalid
      end

      scenario "is invalid without an email" do
        user = User.new(name: "test", password: "testing")
        expect(user).to be_invalid
      end

      scenario "is invalid without a password" do
        user = User.new(name: "test", email: "test@test.com")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      scenario "is valid with a name, email and password" do
        user = User.new(name: "test", email: "test@test.com", password: "testing")
        expect(user).to be_valid
      end
    end

    context "role attribute" do
      scenario "role is defaulting to 0" do
        user = User.new(name: "test", email: "test@test.com", password: "testing")
        expect(user.role).to eq(0)
      end

      scenario "role can be overwritten" do
        user = User.new(name: "test", email: "test@test.com", password: "testing", role: 1)
        expect(user.role).to eq(1)
      end
    end
  end
end
