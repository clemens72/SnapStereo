class User < ActiveRecord::Base
has_many :songs
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 75 }
  validates :email, presence:   true,
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
