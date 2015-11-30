require 'rails_helper'

describe 'user changes status for a link' do
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

  context 'link is unread' do
    it 'works' do
      expect(page).to have_content('false')
      click_link_or_button 'Mark as Read'
      expect(page).to have_content('true')
    end
  end
end