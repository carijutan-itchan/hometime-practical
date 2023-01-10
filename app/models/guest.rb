class Guest < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, :last_name, :email, :contact, presence: true
  validates :email, {format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  validates :contact, uniqueness: true
  
end
