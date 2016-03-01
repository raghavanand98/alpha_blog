class User < ActiveRecord::Base
  has_many :articles
  before_save { self.email = email.downcase }
  
  validates :username, presence: true,
            length:{ minimum: 5, maximum: 20 },
            uniqueness: { case_sensitive: false }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
            
end