require 'rails_helper'

describe 'user signs up' do
  context 'with valid credentials' do
    it 'works' do
      visit root_path
      click_link 'Sign Up'

      expect(current_path).to eq('/users/new')

      fill_in 'Email', with: 'steve@steve.com'
      fill_in 'Password', with: 'steve'
      fill_in 'Confirm Password', with: 'steve'
      click_button 'Create Account'

      expect(current_path).to eq('/links')
      expect(User.count).to eq(1)
    end
  end

end