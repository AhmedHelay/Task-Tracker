# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.integer :user_id, null: false
      t.string :kind
      t.string :target_type
      t.integer :target_id

      t.timestamps
    end
  end
end
