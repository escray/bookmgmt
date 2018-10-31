require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:journal) { Journal.create!(name: 'Journal', shortname: 'JOUR') }
  let(:state) { State.create!(name: 'Hacked') }

  let(:doc) do
    journal.docs.create(name: 'State transitions', editor: user)
  end

  context 'a user without permission to set state' do
    before do
      assign_role!(user, :editor, journal)
      sign_in user
    end

    it 'cannot transition a state by passing through state_id' do
      post :create, params: { comment: { text: 'Did I hack it??',
                                         state_id: state.id },
                              doc_id: doc.id }
      doc.reload
      expect(doc.state).to be_nil
    end

    it 'cannot tag a doc when creating a comment' do
      post :create, params: { comment: { text: 'Tag!',
                                         tag_names: 'one two' },
                              doc_id: doc.id }
      doc.reload
      expect(doc.tags).to be_empty
    end
  end
end
