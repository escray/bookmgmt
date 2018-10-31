require 'rails_helper'

RSpec.describe JournalPolicy do
  subject { JournalPolicy }

  context 'permissions' do
    subject { JournalPolicy.new(user, journal) }

    let(:user) { FactoryBot.create(:user) }
    let(:journal) { FactoryBot.create(:journal) }

    context 'for anonymous users' do
      let(:user) { nil }
      it { should_not permit_action :show }
      it { should_not permit_action :update }
    end

    context 'for viewers of the journal' do
      before { assign_role!(user, :viewer, journal) }
      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context 'for editors of the journal' do
      before { assign_role!(user, :editor, journal) }
      it { should permit_action :show }
      it { should_not permit_action :update }
    end

    context 'for managers of the journal' do
      before { assign_role!(user, :manager, journal) }
      it { should permit_action :show }
      it { should permit_action :update }
    end

    context 'for managers of other journal' do
      before do
        assign_role!(user, :manager,
                     FactoryBot.create(:journal,
                                       name: '学习时报',
                                       shortname: 'XXSB'))
      end
      it { should_not permit_action :show }
      it { should_not permit_action :update }
    end

    context 'for administrators' do
      let(:user) { FactoryBot.create :user, :admin }
      it { should permit_action :show }
      it { should permit_action :update }
    end
  end
end
