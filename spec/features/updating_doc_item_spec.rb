#
require 'rails_helper'

RSpec.feature 'admin can change the item\'s owner' do
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:journal) { FactoryBot.create(:journal) }
  let(:doc) { FactoryBot.create(:doc, journal: journal, editor: admin) }

  before do
    assign_role!(admin, :manager, journal)
    login_as(admin)
    visit journal_doc_path(journal, doc)
  end

  scenario 'lend item to someone' do
    # click_button '借阅'
    # fill_in 'lend', with: '张三'
    # click_button '提交'
    #
    # expect(page).to have_content '张三'
  end
end
