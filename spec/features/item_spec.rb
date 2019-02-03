require 'rails_helper'

feature 'item', type: :feature do
    background do
    user = create!(:user)
    item_images = create_list!(:item_image, 10)
    items = create_list!(:item, 10)
   end
    scenario 'index画面' do
      visit root_path
    end
end




=begin
  scenario 'post tweet' do
    # ~省略~

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('投稿する')
  end
=end
