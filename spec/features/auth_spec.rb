require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'Sign Up'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'vickie'
      fill_in 'password', with: 'password'
      click_on 'Sign Up'
    end

    scenario 'shows username on the homepage after signup' do
      vickie = User.last
      visit user_url(vickie)
      expect(page).to have_content 'vickie'
    end

  end
end

feature 'logging in' do
  before(:each) do
    new_user = create(:user, username: 'vickie', password: 'password')
  end

  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in 'username', with: 'vickie'
    fill_in 'password', with: 'password'
    click_on 'Sign In'
  end
end

feature 'logging out' do
  before(:each) do
    new_user = create(:user, username: 'vickie', password: 'password')
  end

  scenario 'begins with a logged out state' do
    visit new_session_url
    expect(page).to have_content 'Sign In'

    visit new_session_url
    fill_in 'username', with: 'vickie'
    fill_in 'password', with: 'password'
    click_on 'Sign In'
    expect(page).to have_button 'Sign Out'

    click_on 'Sign Out'
    visit new_session_url
    expect(page).not_to have_button 'Sign Out'
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit new_session_url
    expect(page).not_to have_content 'vickie'
  end
end
