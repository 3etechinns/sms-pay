class Organization < ActiveRecord::Base
  attr_accessor :password
  validates_confirmation_of :password
  validates_uniqueness_of :email
  before_save :encrypt_password

  has_many :charges

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    organization = Organization.where(email: email).first

    if organization && organization.password_hash == BCrypt::Engine.hash_secret(password, organization.password_salt)
      organization
    end
  end
end
