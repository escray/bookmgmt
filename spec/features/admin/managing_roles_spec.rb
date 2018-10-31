require 'rails_helper'

RSpec.feature "Admins can manage a user's roles" do
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }
  let!(:id) do
    FactoryBot.create(:journal,
                      name: 'Internet Explorer',
                      shortname: 'IE')
  end
  let!(:st3) do
    FactoryBot.create(:journal,
                      name: 'Sublime Text 3',
                      shortname: 'ST')
  end

  before do
    login_as(admin)
  end

  scenario 'when assigning roles to an existing user' do
    visit admin_user_path(user)
    click_link '编辑用户'

    select 'Viewer', from: 'Internet Explorer'
    select 'Manager', from: 'Sublime Text 3'

    click_button '更新用户'
    expect(page).to have_content '更新用户成功'

    click_link user.cname
    expect(page).to have_content 'Internet Explorer : Viewer'
    expect(page).to have_content 'Sublime Text 3 : Manager'
  end

  scenario 'when assigning roles to a new user' do
    visit new_admin_user_path

    # fill_in '邮箱', with: 'newusertt@example.org'
    fill_in '用户名称', with: 'newbie'
    fill_in '中文名称', with: '中文'
    fill_in '密码', with: 'password'

    select 'Editor', from: 'Internet Explorer'
    click_button '创建用户'

    expect(page).to have_content '新增用户成功'

    click_link '中文 (User)'
    expect(page).to have_content 'Internet Explorer : Editor'
    expect(page).not_to have_content 'Sublime Text 3'
  end
end
