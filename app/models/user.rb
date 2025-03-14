require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  default_scope { where(is_active: true) }

  has_one_attached :profile_picture
  has_many_attached :images

  validates :email, uniqueness: true, presence: true
  validates_presence_of :role
  validate :validate_role

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  private

  def validate_role
    user_role = ConfigurationSetting.find_by(name: 'user_roles')
    raise 'Please add user roles' if user_role.blank?
    
    if user_role.present? && user_role.value.exclude?(self.role)
      errors.add(:role, 'is invalid')
    end
  end
end
