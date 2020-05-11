require 'rails_helper'

feature 'User can sign in' do
  given(:user) { create(:user) }

  background { visit new_user_session_path }

  scenario 'register user try sign in' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario "Registered user can't to sign in with wrong password" do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrong_password'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'Unregistered user tries to sign in' do
    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
  end
end
