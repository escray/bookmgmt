# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can view journals' do
  let(:user) { FactoryBot.create(:user) }
  let(:journal) do
    FactoryBot.create(:journal,
                      name: '世界知识年鉴',
                      shortname: 'SJZSNJ',
                      publisher: '世界知识年鉴出版社')
  end

  before do
    login_as(user)
    assign_role!(user, :viewer, journal)
  end

  scenario 'with the journal details' do
    visit '/journals'
    click_link '世界知识年鉴'
    expect(page.current_url).to eq journal_url(journal)
  end

  scenario 'unless they do not have permission' do
    FactoryBot.create(:journal, name: 'Hidden')
    visit '/journals'
    expect(page).not_to have_content 'Hidden'
  end
end
