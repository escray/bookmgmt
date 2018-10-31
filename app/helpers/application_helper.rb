#
module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << '资料管理').join(' - ')
      end
    end
  end

  def admins_only
    yield if current_user.try(:admin?)
  end
end
