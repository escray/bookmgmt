require 'rails_helper'

RSpec.feature 'User can delete journals' do
  before do
    login_as(FactoryBot.create(:user, :admin))
  end

  scenario 'successfully' do
    FactoryBot.create(:journal, name: '世界知识年鉴', publisher: '世界知识年鉴出版社')
    visit journals_path
    click_link '世界知识年鉴'
    click_link '删除刊物'

    expect(page).to have_content '刊物删除成功'
    expect(page.current_url).to eq journals_url
    expect(page).to have_no_content '世界知识年鉴'
  end
end
