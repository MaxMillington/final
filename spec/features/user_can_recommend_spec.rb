require "rails_helper"

describe "User can recommend links" do

  before do
    steve = User.create(email: 'steve@steve.com',
                        password: 'password',
                        password_confirmation: 'password')

    steve.links.create(title: 'Wildwood', url: 'http://www.wildwoodguitars.com/')

    visit root_path
    click_link 'Login'
    fill_in 'Email', with: 'steve@steve.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  context "user recommends link to someone" do
    it "works" do
      click_link "send link to friend"

      expect(page).to have_content("Wildwood")

      fill_in "Email", with: "charles@charles.com"
      click_button 'Share'

      expect(page).to have_content("Email sent")

    end
  end
end