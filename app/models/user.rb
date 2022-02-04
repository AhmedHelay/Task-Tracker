# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :projects
  has_many :comments, dependent: :destroy
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true,
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
