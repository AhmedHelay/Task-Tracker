class AddFullnameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fullnusame, :string
  end
end
