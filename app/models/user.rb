# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_projects

  has_secure_password

  validates :username, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, presence: true, length: { minimum: 6 }
end
