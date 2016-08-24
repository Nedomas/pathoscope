class CreateBetaTesters < ActiveRecord::Migration
  def change
    create_table :beta_testers do |t|
      t.string :email
      t.string :username
      t.string :password
      t.boolean :sent
      t.boolean :logged_in

      t.timestamps
    end
  end
end
