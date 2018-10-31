require 'rails_helper'

RSpec.describe CommentPolicy do
  context 'permissions' do
    subject { CommentPolicy.new(user, comment) }

    let(:user) { FactoryBot.create(:user) }
    let(:journal) { FactoryBot.create(:journal) }
    let(:doc) { FactoryBot.create(:doc, journal: journal) }
    let(:comment) { FactoryBot.create(:comment, doc: doc) }

    context 'for anonymous users' do
      let(:user) { nil }
      it { should_not permit_action :create }
    end

    context 'for viewers of the journal' do
      before { assign_role!(user, :viewer, journal) }
      it { should_not permit_action :create }
    end

    context 'for editors of the journal' do
      before { assign_role!(user, :editor, journal) }
      it { should permit_action :create }
    end

    context 'for managers of the journal' do
      before { assign_role!(user, :manager, journal) }
      it { should permit_action :create }
    end

    context 'for managers of other journal' do
      before do
        assign_role!(user, :manager,
                     FactoryBot.create(:journal,
                                       name: '学习时报',
                                       shortname: 'XXSB'))
      end
      it { should_not permit_action :create }
    end

    context 'for adminstrators' do
      let(:user) { FactoryBot.create :user, :admin }
      it { should permit_action :create }
    end
  end
end
