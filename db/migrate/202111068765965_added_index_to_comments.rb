class AddedIndexToComments < ActiveRecord::Migration[6.1]
    def change
        add_index :comments, :user_id
        add_index :comments, :task_id
    end
end