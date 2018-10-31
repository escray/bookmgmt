#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         authentication_keys: [:login]

  scope :excluding_archived, -> { where(archived_at: nil) }
  has_many :roles

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # after_initialize :create_login, if: :new_record?

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]/, multiline: true

  def archive
    update(archived_at: Time.now)
  end

  def admin?
    is_admin
  end

  def to_s
    "#{cname} (#{admin? ? 'Admin' : 'User'})"
    # "#{email} (#{admin? ? 'Admin' : 'User'})"
  end

  def role_on(journal)
    roles.find_by(journal_id: journal).try(:name)
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions)
        .where(['lower(username) = :value OR lower(email) = :value',
                { value: login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  # def create_login
  #   if username.blank?
  #     email = self.email.split(/@/)
  #     login_taken = Pro.where(username: email[0]).first
  #     self.username = if login_taken
  #                       self.email
  #                     else
  #                       email[0]
  #                     end
  #   end
  # end
end
