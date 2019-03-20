require 'rails_helper'

RSpec.feature 'Users can only see the appropriate links' do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, :admin) }
  let(:journal) { FactoryBot.create(:journal) }
  let(:doc) { FactoryBot.create(:doc, journal: journal, editor: user) }

  context 'anonymous users' do
    scenario 'cannot see the New Journal link' do
      visit journals_path
      expect(page).not_to have_link '新增刊物'
    end
  end

  context 'non-admin users (journal viewers)' do
    before do
      login_as(user)
      assign_role!(user, :viewer, journal)
    end

    scenario 'cannot see the New Journal link' do
      visit '/journals'
      expect(page).not_to have_link '新增刊物'
    end

    scenario 'cannot see the Delete Journal link' do
      visit journal_path(journal)
      expect(page).not_to have_link '删除刊物'
    end

    scenario 'cannot see the Edit Journal link' do
      visit journal_path(journal)
      expect(page).not_to have_link '编辑刊物'
    end

    scenario 'cannot see the New Doc link' do
      visit journal_path(journal)
      expect(page).not_to have_link '新增资料'
    end

    scenario 'cannot see the Edit Doc link' do
      visit journal_doc_path(journal, doc)
      expect(page).not_to have_link '新增资料'
    end

    scenario 'cannot see the Delete Doc link' do
      visit journal_doc_path(journal, doc)
      expect(page).not_to have_link '删除资料'
    end

    scenario 'cannot see the New Comment form' do
      visit journal_doc_path(journal, doc)
      expect(page).not_to have_heading '新增评论'
    end
  end

  context 'admin users' do
    before { login_as(admin) }

    scenario 'can see the New Journal link' do
      visit journals_path
      expect(page).to have_link '新增刊物'
    end

    scenario 'can see the Delete Journal link' do
      visit journal_path(journal)
      expect(page).to have_link '删除刊物'
    end

    scenario 'can see the Edit Journal link' do
      visit journal_path(journal)
      expect(page).to have_link '编辑刊物'
    end

    scenario 'can see the New Doc link' do
      visit journal_path(journal)
      expect(page).to have_link '新增资料'
    end

    scenario 'can see the Edit Doc link' do
      visit journal_doc_path(journal, doc)
      expect(page).to have_link '编辑资料'
    end

    scenario 'can see the Delete Doc link' do
      visit journal_doc_path(journal, doc)
      expect(page).to have_link '删除资料'
    end

    scenario 'can see the New Comment form' do
      visit journal_doc_path(journal, doc)
      expect(page).to have_button '新增评论'
      expect(page).to have_heading '新增评论'
    end
  end
end
