class Task < ApplicationRecord
    belongs_to :project
    has_many :comments
    
    validates  :project_id , presence:  true
    validates  :title , presence:  true

end
