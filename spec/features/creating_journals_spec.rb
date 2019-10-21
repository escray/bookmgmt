# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'User can create new journals' do
  before do
    login_as(FactoryBot.create(:user, :admin))
    visit '/journals'
    click_link '新增刊物'
  end

  scenario 'with valid attributes' do
    fill_in '刊物名称', with: '半月谈'
    fill_in '名称简写', with: 'BYT'
    fill_in '发行单位', with: '半月谈杂志社'
    fill_in '出版频度', with: '15'
    fill_in '默认份数', with: '3'
    # fill_in '传发单位', with: '人力资源部，企划部，销售部'

    click_button '创建刊物'
    expect(page).to have_content '刊物创建成功'

    journal = Journal.find_by(name: '半月谈')
    expect(page.current_url).to eq journal_url(journal)

    title = '半月谈'
    expect(page).to have_title title
  end

  scenario 'when providing invalid attributes' do
    click_button '创建刊物'
    expect(page).to have_content '刊物创建未成功'
    expect(page).to have_content '不能为空字符'
  end
end
