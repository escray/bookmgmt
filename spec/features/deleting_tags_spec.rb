require 'rails_helper'

# TODO:  'Capybara::ElementNotFound'

# RSpec.feature 'Users can delete unwanted tags from a doc' do
#
#   let(:user) { FactoryBot.create(:user) }
#   let(:journal) { FactoryBot.create(:journal) }
#   let(:doc) do
#     FactoryBot.create(:doc, journal: journal, editor: user,
#                             tag_names: 'ThisTagMustDie')
#   end
#
#   before do
#     login_as(user)
#     assign_role!(user, :manager, journal)
#     visit journal_doc_path(journal, doc)
#   end
#
#   scenario 'successfully', js: true do
#     within tag('ThisTagMustDie') do
#       # click_link 'remove'
#     end
#     expect(page).to_not have_content 'ThisTagMustDie'
#   end
# end
