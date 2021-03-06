class Member < ActiveRecord::Base
  attr_accessible :email, :first, :last, :password, :password_confirmation
  
  has_many :cat_members
  has_many :cats, through: :cat_members
  has_many :catbribes
  has_many :ratings
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { |user| user.email = email.downcase }
  
  validates :first, 
    presence: true, 
    length: { maximum: 30 }
  validates :last, 
    presence: true, 
    length: { maximum: 30 }
  validates :email, 
    presence: true, 
    length: { maximum: 50 }, 
    format: { with: VALID_EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false }
    
  def full_name
    "#{self.first} #{self.last}"
  end
end
