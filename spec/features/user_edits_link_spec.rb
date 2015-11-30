require 'rails_helper'

describe 'user edits a link' do
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

  context 'with valid data' do
    it 'works' do
      click_link 'edit'
      fill_in 'link_title', with: 'Wildwood Amps'
      fill_in 'link_url', with: 'http://www.wildwoodguitars.com/amps/index.htm'
      click_button 'Submit'

      expect(current_path).to eq('/links')
      expect(page).to have_content('Wildwood Amps')
      expect(page).to have_content('http://www.wildwoodguitars.com/amps/index.htm')
    end
  end

  context 'with invalid data' do
    it 'does not work' do
      click_link 'edit'
      fill_in 'link_title', with: 'dumb'
      fill_in 'link_url', with: 'dumb'
      click_button 'Submit'

      expect(page).to have_content('You must enter a title and valid url')
    end
  end
end