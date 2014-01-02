class User < ActiveRecord::Base
  #before_save { self.email = email.downcase }
  
#alternative way to save password as lower case  
  before_save { email.downcase! } 
  validates :name, presence: true, length: { maximum: 50 }

#  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

#improved REGEX to cover xx@cc..com
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }
end
