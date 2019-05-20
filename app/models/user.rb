class User < ActiveRecord::Base
  has_secure_password
  has_many :ratings

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true#, length: { minimum: 5}
  validates :password_confirmation, presence: true
end
