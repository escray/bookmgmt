require 'rails_helper'

RSpec.feature 'Admins can manage states' do
  let!(:state) { FactoryBot.create :state, name: 'New' }

  before do
    login_as(FactoryBot.create(:user, :admin))
    visit admin_states_path
  end

  scenario 'and mark a state as default' do
    within list_item('New') do
      click_link '设为默认'
    end

    expect(page).to have_content "'New' 是默认状态"
  end
end
