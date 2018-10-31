module Admin::ApplicationHelper
  def roles
    hash = {}
    Role.available_roles.each do |role|
      hash[role.titleize] = role
    end
    hash
    # {
    #   'Manager' => 'manager',
    #   'Editor' => 'editor',
    #   'Viewer' => 'viewer'
    # }
  end

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << '资料管理').join(' - ')
      end
    end
  end
end
