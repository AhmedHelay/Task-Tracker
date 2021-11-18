class AddProjectsArrayToUser < ActiveRecord::Migration[6.1]
    def change
        add_column :users, :projects_id, :integer, array:true, default: []
        remove_column :projects, :user_id
        rename_column :users, :fullname, :username
    end
end