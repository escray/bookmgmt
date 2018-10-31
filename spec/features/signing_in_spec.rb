require 'rails_helper'
RSpec.feature 'Users can sign in' do
  let!(:user) { FactoryBot.create(:user) }

  scenario 'with valid credentials' do
    visit '/'
    click_link '登录'
    fill_in '用户名称', with: user.email
    fill_in '登录密码', with: 'password'
    click_button '登录'

    expect(page).to have_content '登录成功'
    expect(page).to have_content user.cname.to_s
  end

  scenario 'with username' do
    visit '/'
    click_link '登录'
    fill_in '用户名称', with: user.username
    fill_in '登录密码', with: 'password'
    click_button '登录'

    expect(page).to have_content '登录成功'
    expect(page).to have_content user.cname.to_s
  end
end
