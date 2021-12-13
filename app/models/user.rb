# frozen_string_literal: true

class User < ApplicationRecord
  has_many :projects

  has_secure_password

  validates :username, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :password, presence: true
end
