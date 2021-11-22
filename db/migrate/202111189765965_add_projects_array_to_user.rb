class AddProjectsArrayToUser < ActiveRecord::Migration[6.1]
    def change
        add_column :users, :projects_id, :integer, array:true, default: []
        remove_column :projects, :user_id , if_exists: true
        remove_column :users, :fullname , if_exists: true
        add_column :users, :username , :string ,if_exists: false
    end
end