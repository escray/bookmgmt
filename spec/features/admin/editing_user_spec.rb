require 'rails_helper'

RSpec.feature "Admins can change a user's details" do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(admin_user)
    visit admin_user_path(user)
    click_link '编辑用户'
  end

  scenario 'with valid details' do
    # fill_in '邮箱', with: 'newguy@example.com'

    click_button '更新用户'

    expect(page).to have_content '更新用户成功'
    # expect(page).to have_content 'newguy@example.com'
    expect(page).to_not have_content user.email
  end

  scenario "when toggling a user's admin ability" do
    check '是否管理员'
    click_button '更新用户'

    expect(page).to have_content '更新用户成功'
    expect(page).to have_content "#{user.cname} (Admin)"
  end
end
