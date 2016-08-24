class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :context, polymorphic: true

      t.timestamps
    end
  end
end
