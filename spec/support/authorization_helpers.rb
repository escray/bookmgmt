module AuthorizationHelpers
  def assign_role!(user, role, journal)
    Role.where(user: user, journal: journal).delete_all
    Role.create!(user: user, role: role, journal: journal)
  end
end

RSpec.configure do |c|
  c.include AuthorizationHelpers
end
