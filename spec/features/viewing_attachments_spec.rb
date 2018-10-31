require 'rails_helper'

RSpec.feature 'Users can view a doc attached files' do
  let(:user) { FactoryBot.create :user }
  let(:journal) { FactoryBot.create :journal }
  let(:doc) { FactoryBot.create :doc, journal: journal, editor: user }
  let!(:attachment) do
    FactoryBot.create :attachment,
                      doc: doc,
                      file_to_attach: 'spec/fixtures/speed.txt'
  end

  before do
    assign_role!(user, :viewer, journal)
    login_as(user)
  end

  scenario 'successfully' do
    visit journal_doc_path(journal, doc)
    click_link 'speed.txt'

    expect(current_path).to eq attachment_path(attachment)
    expect(page).to have_content 'The blink tag can blink faster'
  end
end
