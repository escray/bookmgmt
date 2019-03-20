require 'rails_helper'

RSpec.feature 'Users can view docs' do
  before do
    editor = FactoryBot.create(:user)
    sublime = FactoryBot.create(:journal,
                                name: '乌镇戏剧节',
                                shortname: 'WZXJJ',
                                publisher: '人民日报')
    assign_role!(editor, :viewer, sublime)
    FactoryBot.create(:doc, journal: sublime,
                            name: '文化输出与输入的中转站',
                            editor: editor,
                            origin: '20171130')
    ie = FactoryBot.create(:journal,
                           name: '石垣市议会副议长到访外务省和防卫省',
                           publisher: '参考消息')
    assign_role!(editor, :viewer, ie)
    FactoryBot.create(:doc, journal: ie,
                            name: '外务省和防卫省都派出事务级别官员接待',
                            editor: editor,
                            origin: '20161021')

    login_as(editor)
    visit journals_path
  end
  scenario 'for a given journal' do
    click_link '乌镇戏剧节'
    click_link '资料列表'
    expect(page).to have_content '文化输出与输入的中转站'
    expect(page).to_not have_content '石垣市议会副议长到访外务省和防卫省'

    click_link '文化输出与输入的中转站'
    within('#doc h3') do
      expect(page).to have_content '文化输出与输入的中转站'
    end
    expect(page).to have_content '20171130'
  end
end
