require 'rails_helper'

describe 'user creates a link' do
  before do
    User.create(email: 'steve@steve.com',
                password: 'password',
                password_confirmation: 'password')
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: 'steve@steve.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  context 'with valid link' do
    it 'works' do
      fill_in 'Title', with: 'Wildwood'
      fill_in 'Url', with: 'http://www.wildwoodguitars.com/'
      click_button 'Submit'

      expect(current_path).to eq('/links')
      expect(page).to have_content('Wildwood')
      expect(page).to have_content('http://www.wildwoodguitars.com/')
    end
  end

  context 'with invalid linke' do
    it 'does not work' do
      fill_in 'Title', with: 'Steve'
      fill_in 'Url', with: 'Steve'
      click_button 'Submit'

      expect(current_path).to eq('/links')
      expect(page).to_not have_content('Steve')
      expect(page).to have_content('You must enter a title and valid url')
    end
  end
end