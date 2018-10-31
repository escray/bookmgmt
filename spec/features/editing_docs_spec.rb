require 'rails_helper'

RSpec.feature 'Users can edit existing docs' do
  let(:editor) { FactoryBot.create(:user, :admin) }
  let(:journal) { FactoryBot.create(:journal) }
  let(:doc) { FactoryBot.create(:doc, journal: journal, editor: editor) }

  before do
    assign_role!(editor, :manager, journal)
    login_as(editor)
    visit journal_doc_path(journal, doc)
    click_link '编辑资料'
  end

  scenario 'with valid attributes' do
    fill_in '资料标题', with: '环球时报'
    fill_in '原始编号', with: '999999'
    click_button '更新资料'
    expect(page).to have_content '更新资料成功'
    # within('#doc h4') do
    #   expect(page).not_to have_content doc.name
    #   expect(page).to have_content '环球时报'
    # end
  end
  #
  scenario 'when providing invalid attributes' do
    fill_in '资料标题', with: ''
    click_button '更新资料'
    expect(page).to have_content '更新资料未成功'
  end
end
