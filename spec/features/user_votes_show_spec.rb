require 'rails_helper'

feature 'user votes for post' do
  scenario 'upvotes' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)

    visit root_path
    create_post('first post', 'imgur.com')
    

    find('.up').click

    expect(page).to have_content '1 points'
  end

  scenario 'successfully' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)

    visit root_path

    create_post('first post', 'imgur.com')

    find('.down').click

    expect(page).to have_content '0 points'
  end
end