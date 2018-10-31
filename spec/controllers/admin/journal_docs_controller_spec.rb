require 'rails_helper'

RSpec.describe Admin::JournalDocsController, type: :controller do
  let(:journal) { FactoryBot.create(:journal) }
  let(:user) { FactoryBot.create(:user) }

  before :each do
    assign_role!(user, :editor, journal)
    sign_in user
  end

  it 'can create docs, but not tag them' do
    post :create, params: { doc: { name: 'New doc!',
                                   description: 'Brand spanking new',
                                   tag_names: 'these are tags' },
                            journal_id: journal.shortname }
    expect(Doc.last.tags).not_to be_empty
  end
end
