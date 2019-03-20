require 'rails_helper'
RSpec.feature 'Users can create new doc' do
  let(:user) { FactoryBot.create(:user) }
  let!(:state) { FactoryBot.create :state, name: '新来', default: true }

  before do
    login_as(user)

    journal = FactoryBot.create(:journal,
                                name: '世界知识年鉴',
                                shortname: 'SJZSNJ',
                                publisher: '世界知识年鉴出版社')
    assign_role!(user, :manager, journal)
    visit journal_path(journal)
    # visit '\journals'
    click_link '新增资料'
  end

  scenario 'with valid attributes' do
    fill_in '资料标题', with: '沟上说以色列或将凭借海基核威慑力成为全球军事超级大国'
    fill_in '原始编号', with: '201701'
    fill_in '资料份数', with: '3'

    click_button '创建资料'
    expect(page).to have_content '新增资料成功'
    expect(page).to have_content '资料状态： 在馆'

    within('#doc') do
      expect(page).to have_content user.username.to_s
    end
  end

  scenario 'when providing invalid attributes' do
    click_button '创建资料'

    expect(page).to have_content '新增资料未成功'
    expect(page).to have_content '资料标题不能为空字符'
  end

  scenario 'with an attachment' do
    fill_in '资料标题', with: '沟上说以色列或将凭借海基核威慑力成为全球军事超级大国'
    fill_in '原始编号', with: '201701'
    fill_in '资料份数', with: '3'
    attach_file '资料附件 #1', 'spec/fixtures/Koala.jpg'
    click_button '创建资料'
    expect(page).to have_content '新增资料成功'

    within('#doc .attachments') do
      expect(page).to have_content 'Koala.jpg'
    end
  end

  scenario 'persisting file uploads across from displays' do
    attach_file '资料附件 #1', 'spec/fixtures/speed.txt'
    click_button '创建资料'

    fill_in '资料标题', with: '沟上说以色列或将凭借海基核威慑力成为全球军事超级大国'
    fill_in '原始编号', with: '201701'
    fill_in '资料份数', with: '3'
    click_button '创建资料'
    expect(page).to have_content '新增资料成功'

    within('#doc .attachments') do
      expect(page).to have_content 'speed.txt'
    end
  end

  # TODO:  Failure/Error: raise ActionController::RoutingError,
  # "No route matches [#{env['REQUEST_METHOD']}] #{env['PATH_INFO'].inspect}"
  # ActionController::RoutingError:
  # No route matches [GET] "/fonts/roboto/Roboto-Regular-webfont.woff"
  # scenario 'with multipule attachments', js: true do
  #   fill_in '资料标题', with: '沟上说以色列或将凭借海基核威慑力成为全球军事超级大国'
  #   fill_in '原始编号', with: '201701'
  #   fill_in '资料份数', with: '3'
  #
  #   attach_file '资料附件 #1', Rails.root.join('spec/fixtures/speed.txt')
  #   click_link '新增附件'
  #
  #   attach_file '资料附件 #2', Rails.root.join('spec/fixtures/Desert.jpg')
  #   click_link '新增附件'
  #
  #   attach_file '资料附件 #3', Rails.root.join('spec/fixtures/Koala.jpg')
  #
  #   click_button '创建资料'
  #
  #   expect(page).to have_content '新增资料成功'
  #
  #   within('#doc .attachments') do
  #     expect(page).to have_content 'speed.txt'
  #     expect(page).to have_content 'Desert.jpg'
  #     expect(page).to have_content 'Koala.jpg'
  #   end
  # end

  scenario 'with associated tags' do
    fill_in '资料标题', with: '沟上说以色列或将凭借海基核威慑力成为全球军事超级大国'
    fill_in '原始编号', with: '201701'
    fill_in '资料份数', with: '3'
    fill_in '资料标签', with: 'browser visual'

    click_button '创建资料'

    expect(page).to have_content '新增资料成功'

    within('#doc #tags') do
      expect(page).to have_content 'browser'
      expect(page).to have_content 'visual'
    end
  end
end
