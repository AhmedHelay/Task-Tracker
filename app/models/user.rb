class User < ApplicationRecord
  has_many :projects
  
  validates :fullname, presence:  true
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end