require 'rails_helper'

feature 'User can sign in' do
  scenario 'register user try sign in' do
    visit new_user_session_path
  end

  scenario 'unregiser user try sign in' do

  end
end
