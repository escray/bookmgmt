class CommentPolicy < DocPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
