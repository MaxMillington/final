require 'rails_helper'

describe 'user logs in and out' do
  context 'with valid credentials' do
    it 'works' do
      User.create(email: 'steve@steve.com',
                  password: 'password',
                  password_confirmation: 'password')

      visit root_path
      click_link 'Login'

      expect(current_path).to eq('/login')

      fill_in 'Email', with: 'steve@steve.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      expect(current_path).to eq('/links')
    end
  end

  context 'with invalid credentials' do
    it 'doesnt work' do
      visit root_path
      click_link 'Login'

      expect(current_path).to eq('/login')

      fill_in 'Email', with: 'steve@steve.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      expect(current_path).to eq('/login')
    end
  end

  context 'user signs out' do
    it 'works' do
      User.create(email: 'steve@steve.com',
                  password: 'password',
                  password_confirmation: 'password')

      visit root_path
      click_link 'Login'

      expect(current_path).to eq('/login')

      fill_in 'Email', with: 'steve@steve.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      expect(current_path).to eq('/links')

      click_link 'Log out'

      expect(current_path).to eq('/login')
    end
  end
end