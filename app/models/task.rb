class Task < ApplicationRecord
    belongs_to :project
    
    validates  :project_id , presence:  true
    validates  :title , presence:  true

end
