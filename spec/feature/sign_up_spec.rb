require 'rails_helper'

feature 'User can sign up', %q{
  As an unauthenticated user
} do

  given(:user) { create(:user) }

  background { visit new_user_registration_path }

  scenario 'Registered user tries to sign up' do
    sign_in(user)
    visit new_user_registration_path

    expect(page).not_to have_selector(:link_or_button, 'Sign Up')
  end

  scenario 'Unregistered user tries to sign up with email of registered user' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('Email has already been taken')
  end

  scenario 'Unregistered user tries to sign up' do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('You have signed up successfully.')
  end

  scenario "Unregistered user can't  sign up with wrong email field" do
    fill_in 'Email', with: 'test@test'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('Email is invalid')
  end

  scenario "Unregistered user can't  sign up with wrong password's confirm" do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123455'
    click_on 'Sign up'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
