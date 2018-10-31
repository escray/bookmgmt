require 'rails_helper'

RSpec.feature 'Users can delete docs' do
  let(:editor) { FactoryBot.create(:user) }
  let(:journal) { FactoryBot.create(:journal) }
  let(:doc) { FactoryBot.create(:doc, journal: journal, editor: editor) }

  before do
    login_as(editor)
    assign_role!(editor, :manager, journal)
    visit journal_doc_path(journal, doc)
  end

  scenario 'successfully' do
    click_link '删除资料'

    expect(page).to have_content '资料删除成功'
    expect(page.current_url).to eq journal_docs_url(journal)
  end
end
