require 'rails_helper'

RSpec.describe JournalsController, type: :controller do
  it 'handles a missing journal correctly' do
    get :show, params: { id: 'not-here' }
    expect(response).to redirect_to(journals_path)

    message = '您所查看的外来资料不存在'
    expect(flash[:alert]).to eq message
  end

  it 'handles permission errors by redirecting to a safe place' do
    allow(controller).to receive(:current_user)

    journal = FactoryBot.create(:journal)
    get :show, params: { id: journal }

    expect(response).to redirect_to(root_path)
    message = '您没有操作权限'
    expect(flash[:alert]).to eq message
  end
end
