require 'rails_helper'

feature 'item', type: :feature do
    let(:user_a) { create(:user) }
    let(:user_b) { create(:user, id:item_a.seller_id)}
    let(:item_a) { create(:item, seller_id: user_a.id)}
    let(:item) { create(:item) }
    let(:item_image) {create(:item_image, item_id: item_a.id)}
    background do
      login_as user_a
      allow(Payjp::Customer).to receive(:retrieve).and_return(PayjpMock.prepare_valid_charge)
      allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_valid_charge)
    end

    scenario 'index画面' do
      visit root_path
    end

    scenario 'item詳細画面にアクセス' do
      item_image = create(:item_image, item_id: item_a.id)
      visit item_path(item_a)
      expect(page).to have_content "出品者"
    end

    scenario "購入画面に行く" do
      item_image
      visit "/items/#{item_a.id}/buy_confirm"
    end

    scenario "購入する" do
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
