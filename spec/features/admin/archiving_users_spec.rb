require 'rails_helper'

RSpec.feature 'An admin can archive users' do
  let(:admin_user) { FactoryBot.create(:user, :admin) }
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(admin_user)
  end

  scenario 'successfully' do
    visit admin_user_path(user)
    click_link '归档用户'

    expect(page).to have_content '用户归档成功'
    expect(page).not_to have_content user.email
  end

  scenario 'but cannot archive themselves' do
    visit admin_user_path(admin_user)
    click_link '归档用户'
    expect(page).to have_content '用户不能自我归档'
  end
end
