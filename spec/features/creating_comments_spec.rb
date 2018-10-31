require 'rails_helper'

RSpec.feature 'Users can comment on doc' do
  let(:user) { FactoryBot.create(:user) }
  let(:journal) { FactoryBot.create(:journal) }
  let(:doc) { FactoryBot.create(:doc, journal: journal, editor: user) }

  before do
    login_as(user)
    assign_role!(user, :manager, journal)
  end

  scenario 'with valid attributes' do
    visit journal_doc_path(journal, doc)
    fill_in '资料评论', with: '新增一条评论'
    click_button '新增评论'

    expect(page).to have_content '评论已添加'
    within('#comments') do
      expect(page).to have_content '新增一条评论'
    end
  end

  scenario 'with invalid attributes' do
    visit journal_doc_path(journal, doc)
    click_button '新增评论'

    expect(page).to have_content '评论未添加'
  end

  # TODO: add test for state
  scenario 'when changing a ticket state' do
    # FactoryBot.create(:state, name: '新来')
    visit journal_doc_path(journal, doc)
    fill_in '资料评论', with: '这是一条真实的评论'
    # select '新来', from: '资料状态'
    click_button '新增评论'

    expect(page).to have_content '评论已添加'
    # within('#doc .state') do
    #   expect(page).to have_content '新来'
    # end
    within('#comments') do
      # expect(page).to have_content '状态改变 为 新来'
    end
  end

  scenario 'but cannot change the state without permission' do
    assign_role!(user, :editor, journal)
    visit journal_doc_path(journal, doc)

    expect(page).not_to have_select '资料状态'
  end

  scenario 'when adding a new tag to a ticket' do
    visit journal_doc_path(journal, doc)
    expect(page).not_to have_content 'bug'

    fill_in '资料评论', with: '这是一条有标签的评论'
    fill_in '资料标签', with: '测试'

    click_button '新增评论'

    expect(page).to have_content '评论已添加'
    within('#doc #tags') do
      expect(page).to have_content '测试'
    end
  end
end
