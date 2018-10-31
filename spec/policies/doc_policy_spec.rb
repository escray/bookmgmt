require 'rails_helper'

RSpec.describe DocPolicy do
  context 'permissions' do
    subject { DocPolicy.new(user, doc) }

    let(:user) { FactoryBot.create(:user) }
    let(:journal) { FactoryBot.create(:journal) }
    let(:doc) { FactoryBot.create(:doc, journal: journal, editor: user) }

    context 'for anonymous users' do
      let(:user) { nil }
      # journal = FactoryBot.create(:journal)
      # doc = FactoryBot.create(:doc, journal: journal, editor: nil)
      it { should_not permit_action :show }
      it { should_not permit_action :create }
      it { should_not permit_action :update }
      it { should_not permit_action :destroy }
      it { should_not permit_action :change_state }
      it { should_not permit_action :tag }
    end

    context 'for viewers of the journal' do
      before { assign_role!(user, :viewer, journal) }
      it { should permit_action :show }
      it { should_not permit_action :create }
      it { should_not permit_action :update }
      it { should_not permit_action :destroy }
      it { should_not permit_action :change_state }
      it { should_not permit_action :tag }
    end

    context 'for editors of the journal' do
      before do
        assign_role!(user, :editor, journal)
        doc.editor = FactoryBot.create(:user)
      end
      it { should permit_action :show }
      it { should permit_action :create }
      it { should_not permit_action :update }
      context 'when the editor created the doc' do
        before { doc.editor = user }
        it { should permit_action :update }
      end
      it { should_not permit_action :destroy }
      it { should_not permit_action :change_state }
      it { should_not permit_action :tag }
    end

    context 'for managers of the journal' do
      before { assign_role!(user, :manager, journal) }
      it { should permit_action :show }
      it { should permit_action :create }
      it { should permit_action :update }
      it { should permit_action :destroy }
      it { should permit_action :change_state }
      it { should permit_action :tag }
    end

    context 'for managers of other journal' do
      before do
        assign_role!(user, :manager,
                     FactoryBot.create(:journal,
                                       name: '学习时报',
                                       shortname: 'XXSB'))
      end
      it { should_not permit_action :create }
      it { should_not permit_action :update }
      it { should_not permit_action :destroy }
      it { should_not permit_action :change_state }
      it { should_not permit_action :tag }
    end

    context 'for administrators' do
      let(:user) { FactoryBot.create :user, :admin }
      it { should permit_action :show }
      it { should permit_action :create }
      it { should permit_action :update }
      it { should permit_action :destroy }
      it { should permit_action :change_state }
      it { should permit_action :tag }
    end
  end
end
