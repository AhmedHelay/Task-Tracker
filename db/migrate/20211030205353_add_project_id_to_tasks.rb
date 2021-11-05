class AddProjectIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_index :tasks, :project_id
  end
end
