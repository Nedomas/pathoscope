class AddColorToPath < ActiveRecord::Migration
  def change
    add_column :paths, :color, :integer

    Path.reset_column_information
    Path.all.each_with_index do |path, i|
      path.update_column(:color, i)
    end
  end
end
