class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.boolean :sent, default: false

      t.timestamps
    end
  end
end
