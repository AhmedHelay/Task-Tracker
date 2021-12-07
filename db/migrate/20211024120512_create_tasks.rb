class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :title
      t.text :description
      t.string :status
      t.datetime :deadline_at

      t.timestamps
    end
  end
end
