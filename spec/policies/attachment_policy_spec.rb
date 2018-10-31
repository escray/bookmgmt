require 'rails_helper'

RSpec.describe AttachmentPolicy do
  context 'permissions' do
    subject { AttachmentPolicy.new(user, attachment) }

    let(:user) { FactoryBot.create(:user) }
    let(:journal) { FactoryBot.create(:journal) }
    let(:doc) { FactoryBot.create(:doc, journal: journal) }
    let(:attachment) { FactoryBot.create(:attachment, doc: doc) }

    context 'for anonymous users' do
      let(:user) { nil }
      it { should_not permit_action :show }
    end

    context 'for viewers of the journal' do
      before { assign_role!(user, :viewer, journal) }
      it { should permit_action :show }
    end

    context 'for editors of the journal' do
      before { assign_role!(user, :editor, journal) }
      it { should permit_action :show }
    end

    context 'for managers of the journal' do
      before { assign_role!(user, :editor, journal) }
      it { should permit_action :show }
    end

    context 'for managers of other projects' do
      before do
        assign_role!(user, :manager,
                     FactoryBot.create(:journal,
                                       name: '学习时报',
                                       shortname: 'XXSB'))
      end
      it { should_not permit_action :show }
    end

    context 'for administrators' do
      let(:user) { FactoryBot.create :user, :admin }
      it { should permit_action :show }
    end
  end
end
