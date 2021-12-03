class Project < ApplicationRecord
    has_many :users 
    has_many :tasks  
    has_many :activities , as: :target
    validates :name , presence:  true
end
