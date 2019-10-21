# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can edit existing journals' do
  let(:user) { FactoryBot.create(:user, :admin) }
  let(:journal) do
    FactoryBot.create(:journal,
                      name: '世界知识年鉴',
                      publisher: '世界知识年鉴出版社')
  end

  before do
    # login_as(FactoryBot.create(:user, :admin))
    login_as(user)
    assign_role!(user, :manager, journal)
    visit '/journals'
    click_link '世界知识年鉴'
    click_link '编辑刊物'
  end

  it 'with valid attributes' do
    fill_in '默认份数', with: '2'
    # fill_in '传发单位', with: '维修部 企划部'
    fill_in '出版频度', with: '15'
    fill_in '默认份数', with: '3'
    click_button '更新刊物'
    expect(page).to have_content '世界知识年鉴出版社'
    expect(page).to have_content '刊物更新成功'
    # expect(page).to have_content '维修部 企划部'
  end

  scenario 'when providing invalid attributes' do
    fill_in '刊物名称', with: ''
    fill_in '名称简写', with: 'BYT'
    click_button '更新刊物'
    expect(page).to have_content '刊物更新未成功'
  end
end
