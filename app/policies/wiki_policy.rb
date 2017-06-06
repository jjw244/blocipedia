class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def show?
    wiki.user == user || user.admin? || wiki.private == false || wiki.users.include?(user)
  end

  def edit?
    wiki.user == user || user.admin? || user.premium? || wiki.users.include?(user)
  end
end
