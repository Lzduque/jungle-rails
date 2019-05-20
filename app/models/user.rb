class User < ActiveRecord::Base
  has_secure_password
  has_many :ratings

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, :uniqueness => { :case_sensitive => false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    byebug
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    else
      return false
    end
  end
end