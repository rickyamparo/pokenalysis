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
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    
  end
end
