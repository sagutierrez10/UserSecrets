class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :password, presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end
end
