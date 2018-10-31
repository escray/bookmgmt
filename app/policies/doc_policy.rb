class DocPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    user.try(:admin?) || record.journal.member?(user)
  end

  def create?
    user.try(:admin?) || record.journal.manager?(user) ||
      record.journal.editor?(user)
  end

  def update?
    user.try(:admin?) || record.journal.manager?(user) ||
      (record.journal.editor?(user) && record.editor == user)
  end

  def destroy?
    user.try(:admin?) || record.journal.manager?(user)
  end

  def change_state?
    destroy?
  end

  def tag?
    destroy?
  end
end
