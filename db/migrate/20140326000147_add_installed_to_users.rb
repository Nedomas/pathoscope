class AddInstalledToUsers < ActiveRecord::Migration
  def change
    add_column :users, :installed, :boolean, default: false
  end
end
