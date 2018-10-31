require 'rails_helper'

RSpec.describe Admin::ApplicationController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(user)
  end

  context 'non-admin users' do
    it 'are not able to access the index action' do
      get :index
      expect(response).to redirect_to '/'
      expect(flash[:alert]).to eq '只有管理员才可以登录管理界面'
    end
  end
end
