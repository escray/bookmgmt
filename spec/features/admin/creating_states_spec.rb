require 'rails_helper'

RSpec.feature 'Admins can create new states for docs' do
  let(:admin) { FactoryBot.create(:user, :admin) }

  before do
    login_as(admin)
    # visit '/'
  end

  scenario 'with valid details' do
    visit admin_root_path
    click_link '状态管理'
    click_link '新增状态'

    fill_in '状态名称', with: '测试'
    fill_in '状态颜色', with: 'orange'
    click_button '新增状态'

    expect(page).to have_content '新增状态成功'
  end
end
