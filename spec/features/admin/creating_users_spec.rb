require 'rails_helper'

RSpec.feature 'Admins can create new users' do
  let(:admin) { FactoryBot.create(:user, :admin) }

  before do
    login_as(admin)
    visit '/'
    click_link '系统管理'
    click_link '用户管理'
    click_link '新增用户'
  end

  scenario 'with valid credentials' do
    # fill_in '邮箱', with: 'newbie@example.com'
    fill_in '用户名称', with: 'newbie'
    fill_in '中文名称', with: '中文'
    fill_in '密码', with: 'password'
    click_button '创建用户'
    expect(page).to have_content '新增用户成功'
  end

  scenario 'when the new user is an admin' do
    # fill_in '邮箱', with: 'admin_other@example.com'
    fill_in '用户名称', with: 'newbie'
    fill_in '中文名称', with: '中文'
    fill_in '密码', with: 'password'
    check '是否管理员'
    click_button '创建用户'
    expect(page).to have_content '新增用户成功'
    expect(page).to have_content '中文 (Admin)'
  end
end
