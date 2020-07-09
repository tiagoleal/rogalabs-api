# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates_length_of :password,
                      maximum: 72,
                      minimum: 8,
                      allow_nil: true,
                      allow_blank: false

  validates_presence_of :name, :email
  validates :email, uniqueness: { scope: :email, message: "has registered!" }

  has_many :complaints, dependent: :destroy


  def generate_password_token
    self.reset_password_token = generate_token
    self.reset_password_valid = Time.now.utc
    save!
  end
   
  def password_token_valid?
    (self.reset_password_valid + 4.hours) > Time.now.utc
  end
   
  def reset_password(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end
   
   private
   
  def generate_token
    SecureRandom.hex(10)
  end
end
