class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.references :item, index: true
      t.references :path, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
